require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task default: :test

task :console do
  require 'pry'
  require 'profession'

  def reload!
    files = $LOADED_FEATURES.select { |feat| feat =~ /\/profession\// }
    files.each { |file| load file }
    puts 'Reloaded!'
  end

  ARGV.clear
  Pry.start
end
