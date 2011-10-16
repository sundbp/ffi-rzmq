# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ffi-rzmq}
  s.version = "0.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chuck Remes"]
  s.date = %q{2011-09-14}
  s.description = %q{This gem wraps the ZeroMQ networking library using the ruby FFI (foreign
function interface). It's a pure ruby wrapper so this gem can be loaded
and run by any ruby runtime that supports FFI. That's all of them:
MRI 1.9.x, Rubinius and JRuby.}
  s.email = %q{cremes@mac.com}
  s.extra_rdoc_files = ["AUTHORS.txt", "History.txt", "README.rdoc", "examples/README.rdoc", "version.txt"]
  s.files = [".bnsignore", 
             "History.txt",
             "README.rdoc",
             "Rakefile",
             "examples/README.rdoc",
             "examples/v2api/local_lat.rb",
             "examples/v2api/local_lat_poll.rb",
             "examples/v2api/local_throughput.rb",
             "examples/v2api/publish_subscribe.rb",
             "examples/v2api/remote_lat.rb",
             "examples/v2api/remote_throughput.rb",
             "examples/v2api/reqrep_poll.rb",
             "examples/v2api/request_response.rb",
             "examples/v2api/throughput_measurement.rb",
             "examples/v3api/local_lat.rb",
             "examples/v3api/local_lat_poll.rb",
             "examples/v3api/local_throughput.rb",
             "examples/v3api/publish_subscribe.rb",
             "examples/v3api/remote_lat.rb",
             "examples/v3api/remote_throughput.rb",
             "examples/v3api/reqrep_poll.rb", 
             "examples/v3api/request_response.rb", 
             "examples/v3api/throughput_measurement.rb", 
             "ext/README",
             "ffi-rzmq.gemspec", 
             "lib/ffi-rzmq.rb",
             "lib/ffi-rzmq/constants.rb", 
             "lib/ffi-rzmq/context.rb",
             "lib/ffi-rzmq/device.rb",
             "lib/ffi-rzmq/exceptions.rb",
             "lib/ffi-rzmq/libc.rb", 
             "lib/ffi-rzmq/libzmq.rb",
             "lib/ffi-rzmq/message.rb",
             "lib/ffi-rzmq/poll.rb", 
             "lib/ffi-rzmq/poll_items.rb",
             "lib/ffi-rzmq/socket.rb",
             "lib/ffi-rzmq/util.rb",
             "lib/ffi-rzmq/multipart_message.rb",
             "lib/ffi-rzmq/raw_multipart_message.rb",
             "lib/ffi-rzmq/string_multipart_message.rb",
             "spec/context_spec.rb",
             "spec/device_spec.rb",
             "spec/message_spec.rb",
             "spec/multipart_spec.rb",
             "spec/nonblocking_recv_spec.rb",
             "spec/pushpull_spec.rb",
             "spec/reqrep_spec.rb",
             "spec/socket_spec.rb",
             "spec/spec_helper.rb",
             "version.txt"]

  s.files << "ext/libzmq.dll" if ENV['INCLUDE_ZMQ_DLL']
  s.homepage = %q{http://github.com/chuckremes/ffi-rzmq}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ffi-rzmq}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{This gem wraps the ZeroMQ (0mq) networking library using Ruby FFI (foreign function interface).}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bones>, [">= 3.5.4"])
    else
      s.add_dependency(%q<bones>, [">= 3.5.4"])
    end
  else
    s.add_dependency(%q<bones>, [">= 3.5.4"])
  end
end
