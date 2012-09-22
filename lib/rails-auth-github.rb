require "rails-auth-github/engine"
require "rails-auth-github/helpers"

module RailsAuthGithub
  Unauthorized = Class.new(StandardError)
end
