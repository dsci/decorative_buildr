require "bundler"
require "bundler/setup"

require 'rake/testtask'

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['test/*_spec.rb']
  t.verbose = true
end
