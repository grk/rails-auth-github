require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require
require "rails-auth-github"

module Dummy
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.assets.enabled = true
    config.assets.version = '1.0'

    config.github_auth.client_id = "c43a7ebe21454a998594"
    config.github_auth.client_secret = "76736971228ee42077b06fbf3009b57655722e70"
  end
end

