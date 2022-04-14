require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Testapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    Binance::Api::Configuration.api_key = "n6nZMucKJyjOcHWUeY1DpCflOYBHjzBUA2fdUMs5LIcP9OpnczpTpveb0tBqD9YM"
    Binance::Api::Configuration.secret_key = "X9eiBsNhfJK2RWgnEK29pJ1FeAdkmaUlS71YF54k6LUEXPUgJ5iMRMq7YLpea2U6"

  end
end
