require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Ruan
  class Application < Rails::Application
    config.load_defaults 6.0
    config.hosts << ENV["API_HOST"]

    config.api_only = true
  end
end
