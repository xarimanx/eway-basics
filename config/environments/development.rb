Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true

  EWAY_PAY_BUTTON_KEY = 'epk-1CD35F2A-ECD6-405D-A10B-046D3B4E9784'

  EWAY_API_KEY = 'F9802CLDSnmOLrbsY7sUIGYA6ugt50ks0bekkGUXQobgdHbuYjG3DGkUotYCP1fgZbDpqH'
  EWAY_API_PASS = 'mUvnJZZS'
  EWAY_SERVICE_URL = 'https://api.sandbox.ewaypayments.com'
end
