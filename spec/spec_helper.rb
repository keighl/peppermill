require 'rubygems'
require 'spork'

Spork.prefork do

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'

  include Sorcery::TestHelpers::Rails

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  uploaders = []

  uploaders.each do |uploader|
    uploader.class_eval do |klass|
      def cache_dir
        "#{Rails.root}/spec/support/uploads/tmp"
      end
      def store_dir
        "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    end
  end

  RSpec.configure do |config|

    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.run_all_when_everything_filtered = true
    config.filter_run :focus

    config.include(MailerMacros)
    config.before(:each) { reset_email }
    config.mock_with :rspec
    config.use_transactional_fixtures = true
    config.after(:all) do
      if Rails.env.test?
        FileUtils.rm_rf(Dir["#{Rails.root}/spec/support/uploads"])
      end
    end
  end
end

Spork.each_run do


end

