require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

MultiJson.use :yajl

module Peppermill
  class Application < Rails::Application

    config.encoding = "utf-8"

    config.filter_parameters += [:password]

    config.active_record.whitelist_attributes = true

    config.assets.enabled = true

    config.assets.precompile += %w( application.css lt_ie9.css )
    config.assets.precompile += %w( application.js modernizr.js  )

    config.assets.version = '1.0'

    config.assets.js_compressor = :uglifier

    config.assets.initialize_on_precompile = false

    config.generators do |g|
      g.test_framework  :rspec
      g.template_engine :haml
    end
  end
end
