class Library
  def self.all
    Dir.glob(File.join(Settings.library_root,'*')).select { |file| !File.file?(file) }.map do |dir|
      count = Dir.glob(File.join(dir, '*.rq')).select{ |file| File.file?(file) }.size
      parse_config
      {
        uri: "#{root_url}/#{dir}",
        name: dir,
        description: 'UniProt',
        endpoint: 'https://endpoint_url',
        count: count
      }
    end
  end
  
  def self.parse_config 
    {
      
    }
  end
  
  def to_json
    
  end
end
