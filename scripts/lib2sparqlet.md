require 'tempfile'
require 'fileutils'

def replace_format(endpoint, path)
  params = []
  header = true
  description = nil
  query_lines = []
  contents = File.read(path)
  contents.each_line do |line|
    if matched = line.strip.match(/^#(param|args|ARGS)\s+(.*)$/)
      params << matched[2].split
    elsif header && (matched = line.match(/^# (.*)$/))
      header = false
      description = matched[1]
    else
      query_lines << line
    end
  end
  params = params.flatten
  query_part = query_lines.join('')

  params_part = params.each_with_index.map do |param, i|
    query_part = query_part.gsub(/\$#{i+1}/, "{{arg#{i+1}}}")
    "* `arg#{i+1}`\n  * default: #{param}\n"
  end.join('')


  Tempfile.create do |file|
    file.write(query_part)
    file.rewind
    query_part = `spang/bin/spang mbgd #{file.path} -r spang/etc/prefix,spang/user_prefix -q`
  end

  <<~QUERY
    # #{description}

    ## Parameters
    #{params_part}
    ## Endpoint
    #{endpoint}

    ## `result`

    ```sparql
    #{query_part}
    ```
  QUERY
end


def parse_config(path)
  return nil unless File.exists?(path)
  File.read(path).each_line.map do |line|
    tokens = line.gsub(/^#.*$/, '').split
    tokens[0..1] if tokens.length == 2
  end.compact.to_h
end

Dir.glob(File.join(ARGV[0]  , '*')).select{ |file| !File.file?(file) }.each do |dir|
  dir_name = File.basename(dir)
  base_dir = File.join(ARGV[1], dir_name)
  config = parse_config(File.join(dir,'index.ini'))
  FileUtils.mkdir_p(base_dir)
  Dir.glob(File.join(dir, '*')).select{ |file| File.file?(file) }.each do |template|
    puts "temp: #{template}"
    if(template.end_with?('.rq'))
      dst_path = File.join(base_dir, File.basename(template, '.rq') + '.md')
      File.open(dst_path, 'w') do |file|
          file.write(replace_format(config['endpoint'], template))
      end
    end
  end
end
