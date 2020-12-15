class Library
  
  def self.get_entries
    config_path = File.join(Settings.library_root, 'index.yaml')
    if File.exist?(config_path)
      entries = parse_config(config_path)
    else
      entries = Dir.entries(Settings.library_root).select do |entry|
        File.directory? File.join(Settings.library_root, entry) and !(entry =='.' || entry == '..')
      end.sort.map{ |entry| [entry, { }] }.to_h
    end
    entries
  end

  def self.all
    get_entries.map do |name, conf|
      self.new(name, conf)
    end.compact
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
  
  def self.parse_config(path)
    return nil unless File.exists?(path)
    YAML.load(File.read(path))
  end

  attr_accessor :name, :title, :description, :endpoint, :schema

  def initialize(name, config=nil)
    config ||= self.class.get_entries[name]
    config = config.symbolize_keys
    @name = name
    @title = config[:title] || name
    @query_paths = config[:queries]&.map{ |q| File.join(Settings.library_root, name, q) } ||
      Dir.glob(File.join(Settings.library_root, @name, '*.rq'))
    @query_paths = @query_paths.select{ |file| File.file?(file) }.sort
    @description = config[:title] || name
    @endpoint = config[:endpoint] || ''
    @schema = config[:schema] || ''
  end

  def templates
    @cached_templates ||= @query_paths.map do |file|
      file_name = File.basename(file, '.*')
      Template.new(self, file_name)
    end.compact
    @cached_templates
  end

  def uri
    "#{ Settings.root_url }/library/#{@name}"
  end

  def count
    @query_paths.size
  end

  def to_h(with_templates = false)
    hash = instance_variables.map{ |v| [v[1..-1], instance_variable_get(v)] }.to_h
    hash['uri'] = uri
    hash['count'] = count
    hash['templates'] = templates.map(&:to_h) if with_templates
    hash
  end
end
