Gem::Specification.new do |s|
  s.name        = 'asm-8051'
  s.version     = '0.0.1'
  s.date        = '2016-03-25'
  s.summary     = "8051 instruction emulator"
  s.description = "A great way to execute 8051 instruction set on modern PC"
  s.authors     = ["Vincent Roy-Chevalier"]
  s.email       = 'vincent.roychevalier@yahoo.com'
  s.homepage    = 'https://github.com/vincentroyc/asm-8051'
  s.license     = 'BSD 3-Clause'

  s.files       = `git ls-files`.split("\n")
  s.require_paths = ['lib']
end