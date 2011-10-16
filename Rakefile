begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

namespace :win do

  desc 'Build gem under Windows. Mr Bones just has to break things using tar.'
  task :gem do
    PKG_PATH = File.join(File.dirname(__FILE__), 'pkg')
    NAME = File.basename(File.dirname(__FILE__))
    rm_rf PKG_PATH
    system "gem build #{NAME}.gemspec"
    mkdir_p PKG_PATH
    mv "#{NAME}-*.gem", PKG_PATH
  end
  
  desc 'Install gem under Windows. Mr Bones just has to break things using tar.'
  task :install => :gem do
    PKG_PATH = File.join(File.dirname(__FILE__), 'pkg')
    NAME = File.basename(File.dirname(__FILE__))
    system "gem install #{PKG_PATH}/#{NAME}-*.gem"
  end
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :default => :spec

Bones {
  name 'ffi-rzmq'
  authors 'Chuck Remes'
  email 'cremes@mac.com'
  url 'http://github.com/chuckremes/ffi-rzmq'
  readme_file 'README.rdoc'
  ruby_opts.clear # turn off warnings
  
  # necessary for MRI; unnecessary for JRuby and RBX
  # can't enable this until JRuby & RBX have a way of dealing with it cleanly
  #depend_on 'ffi', '>= 1.0.0'
}

