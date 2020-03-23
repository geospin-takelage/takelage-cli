require 'rake'

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

version = File.read 'lib/takelage/version'
version.chomp!

Gem::Specification.new do |spec|
  spec.name = 'takelage'
  spec.version = version
  spec.authors = ['Geospin']
  spec.email = ['takelage@geospin.de']
  spec.summary = %q{takelage devops workflow cli}
  spec.description = %q{tau is a thor command line script to tame the takelage devops workflow}
  spec.homepage = 'https://github.com/geospin-takelage/takelage-cli'
  spec.license = 'GPL-3.0'
  spec.files = FileList['LICENSE',
                        'README.md',
                        'lib/**/*']
  spec.bindir = 'bin'
  spec.executables << 'tau'
  spec.metadata['yard.run'] = 'yard'
  spec.add_runtime_dependency 'fylla', '~> 0.5'
  spec.add_runtime_dependency 'json', '~> 2.1'
  spec.add_runtime_dependency 'logger', '~> 1.4'
  spec.add_runtime_dependency 'rake', '~> 12.3'
  spec.add_runtime_dependency 'thor', '~> 1.0'
  spec.add_development_dependency 'aruba', '~> 1.0'
  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'cucumber', '~> 3.1'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'yard', '~> 0.9'
end
