require 'rubygems'
require 'rake'

begin
  gem 'jeweler', '~> 1.4'
  require 'jeweler'

  Jeweler::Tasks.new do |gem|
    gem.name        = 'hipe-alphabet'
    gem.summary     = 'how i serialize the non-linear'
    gem.description =  "this is so small it doesn\'t deserve it's own gem"
    gem.email       = 'chip.malice@gmail.com'
    gem.homepage    = 'http://github.com/hipe/hipe-alphabet'
    gem.authors     = [ 'Chip Malice' ]
    gem.bindir      = 'bin'
    # gem.rubyforge_project = 'none'

    gem.add_dependency 'hipe-cli',    '~> 0.0.0'
  end

  Jeweler::GemcutterTasks.new

  # FileList['tasks/**/*.rake'].each { |task| import task }
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: gem install jeweler'
end

desc "hack turns the installed gem into a symlink to this directory"

task :hack do
  kill_path = %x{gem which hipe-alphabet}
  kill_path = File.dirname(File.dirname(kill_path))
  new_name  = File.dirname(kill_path)+'/ok-to-erase-'+File.basename(kill_path)
  FileUtils.mv(kill_path, new_name, :verbose => 1)
  this_path = File.dirname(__FILE__)
  FileUtils.ln_s(this_path, kill_path, :verbose => 1)
end
