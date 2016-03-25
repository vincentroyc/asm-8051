Gem::Specification.new do |s|
  s.name          = 'asm8051'
  s.version       = '0.0.1'
  s.date          = '2016-03-25'
  s.summary       = '8051 instruction emulator'
  s.description   = 'A great way to execute 8051 instruction set on modern PC'
  s.authors       = ['Vincent Roy-Chevalier']
  s.email         = 'vincent.roychevalier@yahoo.com'
  s.homepage      = 'https://github.com/vincentroyc/asm-8051'
  s.license       = 'BSD 3-Clause'

  s.files         = [
    'lib/asm8051/binary.rb',
    'lib/asm8051/hex8.rb',
    'lib/asm8051/hex16.rb',
    'lib/asm8051.rb',
    'asm8051.gemspec',
    'LICENSE.md',
    'README.md'
  ]
  s.require_paths = ['lib']

  s.add_development_dependency 'phare', '~> 0.6'
  s.add_development_dependency 'rubocop', '~> 0.24'
  s.add_development_dependency 'rspec', '~> 3.1'
  s.add_development_dependency 'rake'
end
