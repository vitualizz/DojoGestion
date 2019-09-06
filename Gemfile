source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'

gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false

group :assets do
  gem 'sass-rails', '~> 6.0'
  gem 'coffee-rails', '~> 5.0'
  gem 'uglifier', '~> 4.1'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails', '~> 5.0'
end

group :development do
  gem 'better_errors', '~> 2.5'
  gem 'binding_of_caller', '~> 0.8'
  gem 'pry', '~> 0.12.2'
  gem 'pry-byebug', '~> 3.7'
  gem 'pry-rails', '~> 0.3.9'
  gem 'listen', '~> 3.1.5'
  gem 'haml-rails', '~> 2.0.1'
end

group :test do
  gem 'capybara', '~> 3.28'
  gem 'selenium-webdriver', '~> 3.142'
  gem 'webdrivers', '~> 4.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'haml', '~> 5.1'
gem 'materialize-sass', '~> 1'
gem 'vueonrails', '~> 0.3.0'
gem 'simple_form', '~> 4.1'

# Auth
gem 'devise', '~> 4.7'

# Tenants
gem 'apartment', github: 'influitive/apartment', branch: 'development'
