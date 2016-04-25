
Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'
  require 'omniauth-google-oauth2'
  config.omniauth :google_oauth2, "917516849402-6jo0l5gcpab88unndn4h757sgl5er34e.apps.googleusercontent.com", "hZ9CuKWXlnQLd-quKO82AMDf", { access_type: "offline", approval_prompt: "" }
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
