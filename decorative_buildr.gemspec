Gem::Specification.new do |s|
  s.name        = 'decorative_buildr'
  s.version     = '0.1.5'
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Daniel Schmidt'
  s.email       = 'dsci@code79.net'
  s.summary     = 'DecorativeBuildr!'
  s.description = 'Basic decorator pattern and a simple builder.'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  # This will added later. 
  s.add_development_dependency('minitest','~> 2.11.4')
  s.add_development_dependency('rake')
end