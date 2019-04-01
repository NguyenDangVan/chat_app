source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

source "https://rails-assets.org" do
  gem "rails-assets-datetimepicker"
end

gem "bootstrap-datepicker-rails"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.1.0", require: false
gem 'bootstrap4-kaminari-views'
gem "bootstrap-sass", "3.3.7"
gem "pry"
gem "pnotify-rails"
gem "carrierwave"
gem "coffee-rails", "~> 4.2"
gem "ffaker"
gem "figaro"
gem "font-awesome-rails"
gem "i18n-js"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "mini_magick"
gem "kaminari"
gem "mysql2", ">= 0.3.18", "< 0.6.0"
gem "puma", "~> 3.0"
gem "rails", "~> 5.0.7", ">= 5.0.7.1"
gem "rails-ujs"
gem "ransack"
gem "redis", "~> 3.2"
gem "sass-rails", "~> 5.0"
gem "select2-rails"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platform: :mri
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
