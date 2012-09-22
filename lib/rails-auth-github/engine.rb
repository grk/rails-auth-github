require 'warden-github'
require 'ostruct'

module RailsAuthGithub
  class Engine < ::Rails::Engine
    config.github_auth = ActiveSupport::OrderedOptions.new

    initializer "rails_auth_github.add_middleware" do |app|
      app.middleware.use Warden::Manager do |manager|
        manager.default_strategies :github
        manager.failure_app = lambda{ |env| [301, {'Location' => '/auth/github/failed'}, ['Redirecting']] }
        manager[:github_client_id] = app.config.github_auth.client_id
        manager[:github_secret] = app.config.github_auth.client_secret
        manager[:github_scopes] = app.config.github_auth.scopes.to_s
        manager[:github_oauth_domain] = app.config.github_auth.oauth_domain || 'https://github.com'
        manager[:github_callback_url] = app.config.github_auth.callback_url || '/auth/github/callback'
      end
    end

    initializer "rails_auth_github.add_helpers" do |app|
      ActiveSupport.on_load(:action_controller) do
        include RailsAuthGithub::Helpers
      end
    end
  end
end
