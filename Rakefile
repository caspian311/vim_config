#require 'rake'

base_path  = File.dirname(__FILE__)
home_dir  = ENV['HOME']
backup_dir  = "#{home_dir}/.config_backup"

task :default => [:backup_files, :create_links]

task :backup_files do
  mkdir_p backup_dir
  file_mapping.values do |file|
    cp_r "#{home_dir}/#{file}", "#{backup_dir}/#{file}", verbose: verbose
  end
end

task :create_links do
  link_up file_mapping
end

def file_mapping
  "#{base_path}/bashrc.symlink" => "#{home_dir}/.bashrc",
    "#{base_path}/vimrc.symlink" => "#{home_dir}/.vimrc",
    "#{base_path}/git_bash_prompt.symlink" => "#{home_dir}.git_bash_prompt.bash",
    "#{base_path}/gitconfig.symlink" => "#{home_dir}/.gitconfig",
    "#{base_path}/gitignore.symlink" => "#{home_dir}/.gitignore"
end

def link_up(links)
  links.each do |src, dest|
    symlink(src, dest, verbose: verbose)
  end
end

def verbose
  true
end
