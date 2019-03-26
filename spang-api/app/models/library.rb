class Library
  def self.all
    entries = parse_config(File.join(Settings.library_root,'index.ini'))
    entries.map do |dir, name|
      count = Dir.glob(File.join(Settings.library_root, dir, '*.rq')).select{ |file| File.file?(file) }.size
      config = parse_config(File.join(Settings.library_root, dir, 'index.ini')).symbolize_keys
      if config.nil?
        nil
      else
        {
          uri: "#{ Settings.root_url }/library/#{dir}",
          name: name,
          description: config[:title],
          endpoint: config[:endpoint],
          count: count
        }
      end
    end.compact
  end
  
  def self.parse_config(path)
    return nil unless File.exists?(path)
    File.read(path).each_line.map do |line|
      tokens = line.gsub(/^#.*$/, '').split
      tokens[0..1] if tokens.length == 2
    end.compact.to_h
  end
  
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
  
  def self.find(name)
    config = parse_config(File.join(Settings.library_root, name, 'index.ini')).symbolize_keys
    templates = Dir.glob(File.join(Settings.library_root, name, '*.rq')).select{ |file| File.file?(file) }.map do |file|
      file_name = File.basename(file, '.*')
      parsed = parse_template(file)
      {
        uri: "#{ Settings.root_url }/#{name}/#{file_name}", # TODO: assign unique ID
        name: file_name,
        description: parsed[:description],
        parameters: parsed[:params],
        endpoint: config[:endpoint] #TODO: There may be specific endpoints for each sparql 
      }
    end.compact
    {
      name: name,
      description: config[:title],
      endpoint: config[:endpoint],
      schema: config[:schema],
      templates: templates
    }
  end
end
