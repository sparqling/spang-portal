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

  def self.find_template(library_id, template_id)
    config = parse_config(File.join(Settings.library_root, library_id, 'index.ini')).symbolize_keys
    file_path = File.join(Settings.library_root, library_id, "#{template_id}.rq")
    parsed = parse_template(file_path).symbolize_keys
    {
        name: template_id,
        library_name: library_id,
        description: parsed[:description],
        parameters: parsed[:params],
        query: `spang/bin/spang mbgd #{file_path} -r spang/etc/prefix,spang/user_prefix -q`,
        endpoint: config[:endpoint]
    }
  end



  def self.search(query)
    results = []
    keywords = query.split.map(&:downcase)
    Library.all.map do |library|
      library.templates.each do |template|
        if keywords.all?{ |keyword| [library.name, template.description].any?{ |txt| txt&.downcase.include?(keyword) } }
          results << template
        end
      end
    end.compact
    results.group_by(&:library)
  end


  attr_accessor :library, :name, :description, :parameters

  def initialize(library, template_name)
    @library = library
    @name = template_name
    parsed = self.class.parse_template(file_path)
    @description = parsed[:description]
    @parameters = parsed[:params]
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

  def query
    `spang/bin/spang mbgd #{file_path} -r spang/etc/prefix,spang/user_prefix -q`
  end

  private

  def self.parse_sparql_doc(file_path)
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
              val << matches[2].strip
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
        query_lines << line
      end
    end
    @description = description_lines.join("\n") unless description_lines.empty?
    @query = query_lines.join("\n") unless query_lines.empty?
    @query.strip!
    query_lines.each do |line|
      if (matches = line.match(/^ *PREFIX *([a-zA-Z_-]+) *: *<(.+)>$/i) )
        @prefixes[ matches[1] ] = matches[2]
      end
      if (matches = line.match(/^ *(SELECT|CONSTRUCT|DESCRIBE|ASK) */i) )
        @type = matches[1].upcase
      end
    end
  end
end
