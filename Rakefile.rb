require 'rake/testtask'

task :default => [:test]

task :tetris do |t|
  ruby 'tetris.rb'
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end