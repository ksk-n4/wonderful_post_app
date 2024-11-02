require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WonderfulPostApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    # I18nライブラリに訳文の探索場所を指示する
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s] # 追加
    # デフォルトのlocaleを日本語(:ja)にする
    config.i18n.default_locale = :ja # 追加
    # ロケールのリストを渡す
    I18n.available_locales = [:en, :ja] # 追加

    # Rails自体のアプリケーションの時刻の設定
    config.time_zone = "Tokyo" # 追加
    # DBを読み書きする際に、DBに記録されている時間をどのタイムゾーンで読み込むかの設定
    config.active_record.default_timezone = :local # 追加

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.generators do |g|
      g.jbuilder false
      g.javascripts false
      g.stylesheets false
      g.helper false
      g.test_framework false
    end
  end
end
