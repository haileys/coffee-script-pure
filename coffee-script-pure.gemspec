Gem::Specification.new do |s|
  s.name            = "coffee-script-pure"
  s.version         = "0.0.2"
  s.date            = "2010-01-10"
  s.homepage        = "https://github.com/charliesome/coffee-script-pure"
  s.summary         = "A CoffeeScript compiler is pure Ruby"
  s.description     = "coffee-script pure uses the Twostroke Javascript interpreter to run the CoffeeScript compiler inside Ruby"
  s.files           = ["lib/coffee-script-pure.rb", "lib/coffee-script.tsz"]
  s.authors         = ["Charlie Somerville"]
  s.email           = "charlie@charliesomerville.com"
  s.required_ruby_version = ">= 1.9.2"
  
  s.add_dependency  "twostroke", "~> 0.2.2"
end