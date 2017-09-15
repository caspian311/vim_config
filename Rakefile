require 'rake'
require 'byebug'
require 'pathname'

task default: %i[brew_install global_ruby_gems create_links]

desc 'Install all brew packages'
task :brew_install do
  packages = %( git macvim ctags bash-completion bash-git-prompt )

  puts 'Brew install...'
  `brew install #{packages}`
  puts 'Done'
end

desc 'Install all global ruby gems'
task :global_ruby_gems do
  gems = %( rubocop )

  puts 'Installing gems...'
  `gem install #{gems}`
  puts 'Done'
end

task remove_previous_files: :backup_files do
  puts 'Removing old files...'
  file_mapping.each_value do |full_path_to_file|
    puts "removing #{full_path_to_file}"
    File.delete full_path_to_file if File.exist? full_path_to_file
  end
  puts 'Done'
end

task :backup_files do
  puts "Backing up files to #{backup_dir}..."
  mkdir_p backup_dir
  file_mapping.each_value do |full_path_to_file|
    file = Pathname.new(full_path_to_file).basename
    cp_r full_path_to_file, File.join(backup_dir, file), verbose: verbose if File.exist? full_path_to_file
    puts "#{full_path_to_file} did not exist!!!" unless File.exist? full_path_to_file
  end
  puts 'Done'
end

desc 'Create symlinks of needed files'
task create_links: :remove_previous_files do
  file_mapping.each do |src, dest|
    symlink src, dest, verbose: verbose
  end
end

def file_mapping
  file_mapping_data = {
    'bashrc.symlink' => '.bashrc',
    'bash_profile.symlink' => '.bash_profile',
    'vimrc.symlink' => '.vimrc',
    'git_bash_prompt.symlink' => '.git_bash_prompt.bash',
    'gitconfig.symlink' => '.gitconfig',
    'gitignore.symlink' => '.gitignore',
    'rubocop.symlink' => '.rubocop.yml'
  }
  Hash[file_mapping_data.map{|k,v| [File.join(base_path, k), File.join(home_dir, v)]}]
end

def verbose
  true
end

def base_path
  File.dirname(__FILE__)
end

def home_dir
  ENV['HOME']
end

def backup_dir
  "#{home_dir}/.config_backup"
end
