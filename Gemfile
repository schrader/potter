source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.beta1'

gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0.beta1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', platforms: :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'bourbon'
  gem 'neat'
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails"
end

gem "draper"

gem "letter_opener", :group => :development

gem 'jquery-rails'

gem 'simple_form', git: 'git://github.com/plataformatec/simple_form.git'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'


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

# To use debugger
# gem 'debugger'
