source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4'

# Use postgresql as the database for Active Record
gem 'pg'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use Capistrano for deployment
gem 'capistrano', group: :development
gem 'rvm-capistrano'

# authentication
gem 'devise'
# admin
gem 'rails_admin'

# email preview
gem 'mail_view', '~> 1.0.3'

# pdf generation
gem 'prawn'

group :production do
  # scheduling
  gem 'whenever', require: false
  # email exceptions
  gem 'exception_notification'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.14'
  gem 'capybara', '~> 2.0.0'
end

group :test do
  gem 'rake'
end
