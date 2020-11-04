class Library

  def self.all
    config_path = File.join(Settings.library_root,'index.ini')
    if File.exist?(config_path)
      entries = parse_config(config_path)
    else
      entries = Dir.entries(Settings.library_root).select do
          |entry| File.directory? File.join(Settings.library_root, entry) and !(entry =='.' || entry == '..') 
      end.sort.map{ |entry| [entry, nil] }
    end
    entries.map do |dir, _|
      self.new(dir)
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
    File.read(path).each_line.map do |line|
      tokens = line.gsub(/^#.*$/, '').split
      tokens[0..1] if tokens.length == 2
    end.compact.to_h
  end

  attr_accessor :name, :title, :description, :endpoint, :schema

  def initialize(name)
    config_path = File.join(Settings.library_root, name, 'index.ini')
    if File.exist?(config_path)
      config = self.class.parse_config(config_path).symbolize_keys
    else
      config = {}
    end
    @name = name
    @title = config[:title] || name 
    @description = config[:title] || name
    @endpoint = config[:endpoint] || ''
    @schema = config[:schema] || ''
  end

  def templates
    @cached_templates ||= Dir.glob(File.join(Settings.library_root, @name, '*.rq')).select{ |file| File.file?(file) }.sort.map do |file|
      file_name = File.basename(file, '.*')
      Template.new(self, file_name)
    end.compact
    @cached_templates
  end

  def uri
    "#{ Settings.root_url }/library/#{@name}"
  end

  def count
    Dir.glob(File.join(Settings.library_root, @name, '*.rq')).select{ |file| File.file?(file) }.size
  end

  def to_h(with_templates = false)
    hash = instance_variables.map{ |v| [v[1..-1], instance_variable_get(v)] }.to_h
    hash['uri'] = uri
    hash['count'] = count
    hash['templates'] = templates.map(&:to_h) if with_templates
    puts "hash: #{hash}"
    hash
  end
end
