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
  
  def create_param_options(external_params=nil)
    params = @param.map{ |pair| [pair[:name], pair[:default]] }.to_h
    params = params.merge(external_params) if external_params
    return '' if params.length == 0
    '-p ' + params.map { |k, v| "#{k}=#{v}" }.join(',')
  end
  
  def create_sparql_file(file)
    file.write(@raw_query)
    file.rewind
  end

  def query
    @cached_query =
        Tempfile.create do |file|
          create_sparql_file(file)
          `spang2 #{file.path} -r spang/etc/prefix,spang/user_prefix -q #{create_param_options}`
        end
    @cached_query
  end

  def query_to_endpoint(external_params)
      Tempfile.create do |file|
        create_sparql_file(file)
        `spang2 -e #{endpoint} #{file.path} -r spang/etc/prefix,spang/user_prefix #{create_param_options(external_params)}`
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
