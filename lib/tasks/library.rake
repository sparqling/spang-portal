namespace :library do
  desc 'Update library by retrieving files from github contents'
  task :update do
    local_path = Settings.library_root
    remote_path = Settings.repository.path
    user = Settings.repository.user
    name = Settings.repository.name
    branch = Settings.repository.branch
    unless local_path && remote_path && user && name && branch
      STDERR.puts "Configuration is missing!".red 
      STDERR.puts "Specify library_root in settings.yaml".red unless local_path
      STDERR.puts "Specify repository.path in settings.yaml".red unless remote_path
      STDERR.puts "Specify repository.user in settings.yaml".red unless user
      STDERR.puts "Specify repository.name in settings.yaml".red unless name
      STDERR.puts "Specify repository.branch in settings.yaml".red unless branch
    else
      local_path = Rails.root.join(local_path)
      `rm -rf #{local_path}`
      if branch == 'master'
        branch = 'trunk'
      else
        branch = "branches/#{branch}"
      end
      
      `svn export https://github.com/#{user}/#{name}/#{branch}/#{remote_path} #{local_path}`
    end
  end
end
