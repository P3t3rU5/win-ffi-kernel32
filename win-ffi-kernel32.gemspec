require_relative 'lib/win-ffi/kernel32/version'

Gem::Specification.new do |gem|
  gem.name          = 'win-ffi-kernel32'
  gem.version       = WinFFI::Kernel32::VERSION
  gem.summary       = 'FFI definitions for kernel32.dll Windows API'
  gem.description   = 'FFI definitions for kernel32.dll Windows API.'
  gem.license       = 'MIT'
  gem.authors       = %w'P3t3rU5'
  gem.email         = %w'pedro.at.miranda@gmail.com'
  gem.homepage      = 'https://github.com/P3t3rU5/win-ffi-kernel32'
  gem.require_paths = %w'lib'
  gem.files         = Dir['{lib/**/*.rb,*.md}']
  gem.add_dependency 'win-ffi-core', '~> 1'
  gem.add_development_dependency 'rspec', '~> 3.4'
end
