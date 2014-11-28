require 'rdoc/task'
require 'rubygems/package_task'
require 'rake/testtask'

Gem::PackageTask.new(eval File.read('mime.gemspec')) do |pkg|
  pkg.need_tar_gz = true
end

RDoc::Task.new do |rdoc|
  rdoc.main = 'README.rdoc'
  rdoc.rdoc_dir = 'doc'
  rdoc.rdoc_files.include('README.rdoc', 'lib/')
  rdoc.options << "--all"
end

Rake::TestTask.new do |t|
  t.warning = true
end
