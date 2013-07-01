source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "capistrano"
  gem "rvm-capistrano"
  gem 'annotate', ">=2.5.0"  
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end

group :development, :test do
  gem "rspec-rails", "~> 2.12"
  gem 'guard-rspec'
  gem 'sqlite3'  
end

group :test do 
  gem 'sqlite3' 
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'simplecov', :require => false
  gem 'database_cleaner'
  gem 'rb-inotify', '~> 0.8.8'
  gem 'libnotify'
end

group :development, :production do
  gem 'pg'
end

group :production do 
  gem 'unicorn'  
end

gem 'jquery-rails'
gem 'decent_exposure'
gem 'russian'

# Elasticsearch
gem 'tire'

gem 'bootstrap-sass', '~> 2.3.1.0'
gem 'bootstrap-will_paginate'
gem 'haml'

gem 'will_paginate', '~> 3.0'

gem 'whenever', :require => false
gem 'sitemap_generator'

gem 'activeadmin', github: 'gregbell/active_admin'
gem 'ckeditor'
gem 'paperclip', '~> 3.0'
gem 'sanitize'

gem 'nokogiri'

gem 'acts-as-taggable-on'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
