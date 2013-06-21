source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc1'
gem 'sqlite3'
gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0.rc1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', platforms: :ruby
  gem 'uglifier', '>= 1.3.0'
  gem 'bourbon'
  gem 'neat'
  gem 'bootstrap-sass', '>= 2.3.1.0'
  gem 'coffee-rails', '~> 4.0.0'
end

gem 'coffee-rails', '~> 4.0.0'

gem "draper"

gem "letter_opener", :group => :development

gem 'jquery-rails'

gem 'simple_form', git: 'git://github.com/plataformatec/simple_form.git'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# gem 'jquery-turbolinks'


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

gem 'devise', git: "git@github.com:plataformatec/devise.git", branch: "rails4"

gem 'rails-i18n'

gem 'public_activity', github: "pokonski/public_activity", branch: "rails4"

gem 'meta_request'

gem 'better_errors'

gem "binding_of_caller"

gem 'pry-rails'

gem 'chronic'

gem 'postmark-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
group :development do
  gem 'capistrano'
  gem 'capistrano-unicorn'
  gem 'rvm-capistrano'
end

group :test, :development do
  gem 'factory_girl_rails'
  gem 'timecop'
end
gem 'whenever', :require => false

# To use debugger
# gem 'debugger'
