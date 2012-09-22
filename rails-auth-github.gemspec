$:.push File.expand_path("../lib", __FILE__)

require "rails-auth-github/version"

Gem::Specification.new do |s|
  s.name        = "rails-auth-github"
  s.version     = RailsAuthGithub::VERSION
  s.authors     = ["Grzesiek Kolodziejczyk"]
  s.email       = ["gk@code-fu.pl"]
  s.homepage    = "https://github.com/grk/rails-auth-github"
  s.summary     = "A simple Rails engine to authorize users against github oauth."

  s.files = Dir["{app,config,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "warden-github", "~> 0.11.0"
end
