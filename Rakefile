#require 'rake'

BASE_PATH  = File.dirname(__FILE__)
HOME_DIR  = ENV['HOME']
BACKUP_DIR  = "#{ENV['HOME']}/.config_backup"

task :default => [:backup_files, :create_links]

task :backup_files do
  mkdir_p BACKUP_DIR
  file_mapping.values do |file|
    cp_r "#{HOME_DIR}/#{file}", "#{BACKUP_DIR}/#{file}", verbose: verbose
  end
end

task :create_links do
  link_up file_mapping
end

def file_mapping
  "#{BASE_PATH}/bashrc.symlink" => "#{HOME_DIR}/.bashrc",
    "#{BASE_PATH}/vimrc.symlink" => "#{HOME_DIR}/.vimrc",
    "#{BASE_PATH}/git_bash_prompt.symlink" => "#{HOME_DIR}.git_bash_prompt.bash",
    "#{BASE_PATH}/gitconfig.symlink" => "#{HOME_DIR}/.gitconfig",
    "#{BASE_PATH}/gitignore.symlink" => "#{HOME_DIR}/.gitignore"
end

def link_up(links)
  links.each do |src, dest|
    symlink(src, dest, verbose: verbose)
  end
end

def verbose
  true
end
