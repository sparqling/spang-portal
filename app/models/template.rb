class Template

  ANNOTATIONS = {
      :author => {
          :multi => true
      },
      :see => {
          :multi => true
      },
      :tag => {
          :multi => true
      },
      :title => {
          :multi => false
      },
      :endpoint => {
          :multi => true
      },
      :param => {
          :multi => true
      }
  }

  def self.parse_template(path)
    return nil unless File.exists?(path)
    params = []
    contents = File.read(path)
    contents.each_line do |line|
      if matched = line.strip.match(/^#(param|args|ARGS)\s+(.*)$/)
        params << matched[2].split
      end
    end

    description = nil
    if matched = contents.lines.first.match(/^# (.*)$/)
      description = matched[1]
    end
    {
        params: params.flatten,
        description: description.to_s,
    }
  end

  def self.search(query)
    results = []
    keywords = query.split.map(&:downcase)
    Library.all.map do |library|
      library.templates.each do |template|
        if keywords.all?{ |keyword| [library.name, template.description, template.name].any?{ |txt| txt&.downcase&.include?(keyword) } }
          results << template
        end
      end
    end.compact
    results.group_by(&:library)
  end

  attr_accessor :library, :name, :title, :param, :description

  def initialize(library, template_name)
    @library = library
    @name = template_name
    ANNOTATIONS.each do |k, v|
      instance_variable_set("@#{k}", []) if v[:multi]
    end
    parse_sparql_doc(file_path)
  end

  def file_path
    File.join(Settings.library_root, @library.name, @name + '.rq')
  end

  def uri
    "#{ Settings.root_url }/#{@library.name}/#{@name}"
  end

  def endpoint
    library.endpoint
  end
  
  def create_sparql_file(file, external_params=nil)
    tmp_query = @raw_query
    params = @param.map{ |pair| [pair[:name], pair[:default]] }.to_h
    params = params.merge(external_params) if external_params
    params.each do |k, v|
      if v
        tmp_query = tmp_query.gsub("$#{k}", v)
      end
    end 
    puts tmp_query
    file.write(tmp_query)
    file.rewind
  end

  def query
    @cached_query ||=
        Tempfile.create do |file|
          create_sparql_file(file)
          `spang/bin/spang mbgd #{file.path} -r spang/etc/prefix,spang/user_prefix -q`
        end
    @cached_query
  end

  def query_to_endpoint(external_params)
      Tempfile.create do |file|
        create_sparql_file(file, external_params)
        `spang/bin/spang #{endpoint} #{file.path} -r spang/etc/prefix,spang/user_prefix`
      end
  end



  def to_h
    %w[name title uri endpoint param].map do |prop|
      [prop, send(prop)]
    end.to_h
  end

  private

  def parse_sparql_doc(file_path)
    query_lines = []
    header = true
    description = false
    description_lines = []
    File.read(file_path).each_line do |line|
      if ( header && line.match(/^#/) )
        if ( matches = line.match(/^# *@([a-zA-Z]+) *(.+)$/i) )
          annotation = matches[1]
          config = ANNOTATIONS[ annotation.to_sym ]
          if config
            if config[:multi]
              val = instance_variable_get("@#{annotation}")
              if annotation == 'param'
                name, default = matches[2].strip.split('=')
                val << { name: name, default: default }
              else
                val << matches[2].strip
              end
              instance_variable_set("@#{annotation}", val)
            else
              instance_variable_set("@#{annotation}", matches[2].strip)
            end
            description = true
          else
            $stderr.puts("Ignoring unknown annotation: @#{annotation}")
          end
        else if (description == false)
               description_lines << line[1..-1].strip
             end
        end
      else
        header = false
        query_lines << line.gsub("\n", '')
      end
    end
    @description = description_lines.join("\n") unless description_lines.empty?
    @raw_query = query_lines.join("\n") unless query_lines.empty?
    @raw_query.strip!
  end
end
