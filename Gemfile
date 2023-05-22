source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use Mongo as Database
gem 'mongoid', '~> 8.0.3'

# Use to scrape
gem 'nokogiri', '~> 1.15', '>= 1.15.1'

# Use to paginate
gem 'kaminari', '~> 0.17.0'
gem 'kaminari-mongoid'

# Use to run the crons
gem 'sidekiq', '~> 7.1.0'
gem 'sidekiq-scheduler', '~> 5.0.2'

gem 'rswag', '~> 2.9.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "rspec-rails"
  gem 'rswag-specs', '~> 2.9.0'
end
