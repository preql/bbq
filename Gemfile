source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.5'

gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'

gem 'rails', '~> 5.2.3'
gem 'resque'
gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n'
gem "pundit"
gem 'twitter-bootstrap-rails'
gem 'font-awesome-rails'
gem 'uglifier', '>= 1.3.0'
gem 'simple_form'
gem 'jquery-rails'
gem 'carrierwave'
gem 'rmagick'
gem 'fog-aws'

gem 'bootsnap', '>= 1.1.0', require: false

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'capistrano', '~> 3.11.0'
  gem 'capistrano-rails', '~> 1.3.0'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-bundler', '~> 1.4.0'
  gem 'capistrano-resque', '~> 0.2.3', require: false
  gem 'web-console', '>= 3.3.0'
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

