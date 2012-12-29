require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push "test" #or t.libs << "lib" 
  t.test_files = FileList['unit_test/*_tests.rb']
  t.verbose = true
end