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
          uri: "#{ Settings.root_url }/#{dir}",
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
      tokens = line.gsub(/^.*#.+$/, '').split
      tokens[0..1] if tokens.length == 2
    end.compact.to_h
  end
end
