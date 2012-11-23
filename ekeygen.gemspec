# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','ekeygen','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'ekeygen'
  s.version = Ekeygen::VERSION
  s.author = 'Leffen'
  s.email = 'leffen@gmail.com'
  s.homepage = 'http://leffen.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Simple tool for generating encrypted environment variables'
# Add your other files here if you make them
  s.files = %w(
bin/ekeygen
lib/ekeygen/version.rb
lib/ekeygen.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','ekeygen.rdoc']
  s.rdoc_options << '--title' << 'ekeygen' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'ekeygen'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.5.0')
  s.add_runtime_dependency('symmetric-encryption','0.9.1')
end
