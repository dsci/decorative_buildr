Gem::Specification.new do |s|
  s.name        = 'decorative_buildr'
  s.version     = '0.1.1'
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Daniel Schmidt'
  s.email       = 'dsci@code79.net'
  s.summary     = 'DecorativeBuildr!'
  s.description = 'Basic decorator pattern and a simple builder.'

  s.files         = ['decorative_buildr.rb','base_decorator.rb', 'builder.rb']
  #s.test_file     = 'bang_spec.rb'
  s.require_path  = '.'

  # This will added later. 
  #s.add_development_dependency('rspec', ["~> 2.0"])
end