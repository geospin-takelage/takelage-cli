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
  spec.description = %q{tau-cli is a thor command line script to tame the takelage devops workflow}
  spec.homepage = 'https://geospin.de'
  spec.license = 'GPL-3.0'
  spec.files = FileList['LICENSE',
                        'README.md',
                        'lib/**/*']
  spec.bindir = 'bin'
  spec.executables << 'tau'
  spec.metadata['yard.run'] = 'yard'
  spec.add_runtime_dependency 'json', '~> 2.1'
  spec.add_runtime_dependency 'logger', '~> 1.3'
  spec.add_runtime_dependency 'rake', '~> 12.3'
  spec.add_runtime_dependency 'thor', '~> 0.20'
  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.9'
end
