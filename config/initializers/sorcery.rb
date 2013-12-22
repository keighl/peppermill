Rails.application.config.sorcery.configure do |config|

  config.user_config do |user|
    user.username_attribute_names           = [:email, :username]
    user.downcase_username_before_authenticating = true
  end

  config.user_class = "User"
end
