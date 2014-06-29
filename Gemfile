source "https://rubygems.org"

ruby "2.1.1"
gem "rails", "4.1.2"

gem "bootstrap-sass"
gem "coffee-rails"
gem "fog"
gem "jbuilder"
gem "jquery-rails"
gem "mini_exiftool_vendored"
gem "omniauth-github"
gem "pg"
gem "sass-rails"
gem "turbolinks"
gem "uglifier"
gem "unf"

group :development do
  gem "better_errors"
  gem "binding_of_caller", :platforms => [:mri_19, :mri_20, :rbx]
  gem "guard-bundler"
  gem "guard-rails"
  gem "guard-rspec"
  gem "hub", :require => nil
  gem "quiet_assets"
  gem "rails_layout"
  gem "rb-fchange", :require => false
  gem "rb-fsevent", :require => false
  gem "rb-inotify", :require => false
end

group :development, :test do
  gem "minitest-rails-capybara"
  gem "dotenv-rails"
  gem "pry"
  gem "rspec-rails"
end

group :production do
  gem "unicorn"
end

group :test do
  gem "capybara"
  gem "database_cleaner", "1.0.1"
  gem "email_spec"
  gem "machinist"
  gem "rack_session_access"
end
