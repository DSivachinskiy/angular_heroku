require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Again
  class Application < Rails::Application

config.generators do |g|
  g.test_framework :rspec
  g.fixture_replacement :factory_girl, dir: 'spec/factories'
end
config.serve_static_assets = true
config.assets.precompile.shift

# Add additional asset pathes
config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')
config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components', 'bootstrap', 'dist', 'fonts', 'js', 'grunt', 'lessvise')
config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components', 'angular')
config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components', 'angular-devise', 'lib', 'src', 'test')
config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components', 'angular-ui-router', 'api', 'release', 'src')
config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components', 'jquery', 'dist', 'src')
# Precompile additional asset types
config.assets.precompile.push(Proc.new do |path|
  File.extname(path).in? [
    '.html', '.erb', '.haml',                 # Templates
    '.png',  '.gif', '.jpg', '.jpeg', '.svg', # Images
    '.eot',  '.otf', '.svc', '.woff', '.ttf', '.woff2', # Fonts
  ]
end)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
