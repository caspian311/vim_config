require 'rake'
require 'byebug'
require 'pathname'

task :default => [:backup_files, :remove_previous_files, :create_links]

task :remove_previous_files do
  puts "Removing old files..."
  file_mapping.values.each do |full_path_to_file|
    puts "removing #{full_path_to_file}"
    File.delete full_path_to_file if File.exists? full_path_to_file
  end
  puts "Done"
end

task :backup_files do
  puts "Backing up files to #{backup_dir}..."
  mkdir_p backup_dir
  file_mapping.values.each do |full_path_to_file|
    file = Pathname.new(full_path_to_file).basename
    cp_r full_path_to_file, File.join(backup_dir, file), verbose: verbose if File.exists? full_path_to_file
  end
  puts "Done"
end

task :create_links do
  link_up file_mapping
end

def file_mapping
  {
    File.join(base_path, "bashrc.symlink") => File.join(home_dir, '.bashrc'),
    File.join(base_path, "vimrc.symlink") => File.join(home_dir, '.vimrc'),
    File.join(base_path, "git_bash_prompt.symlink") => File.join(home_dir, '.git_bash_prompt.bash'),
    File.join(base_path, "gitconfig.symlink") => File.join(home_dir, '.gitconfig'),
    File.join(base_path, "gitignore.symlink") => File.join(home_dir, '.gitignore')
  }
end

def link_up(links)
  links.each do |src, dest|
    symlink src, dest, verbose: verbose
  end
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

