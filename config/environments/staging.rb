Peppermill::Application.configure do

  ROOT_URL  = "http://dev.example.com"
  ROOT_HOST = "dev.example.com"

  config.cache_classes = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_assets = false

  config.assets.compress = true

  config.assets.compile = false

  config.assets.digest = true

  config.cache_store = :dalli_store

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify
end
