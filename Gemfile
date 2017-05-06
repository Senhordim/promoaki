source 'https://rubygems.org'

ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
gem 'rails-i18n', '~> 5.0.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-ionicons'
  gem 'rails-assets-iCheck'
  gem 'rails-assets-morrisjs'
  gem 'rails-assets-slimScroll'
  gem 'rails-assets-raphael'
  gem 'rails-assets-fastclick'
  gem 'rails-assets-underscore'
end

gem "font-awesome-rails"
gem 'bootstrap-datepicker-rails'
gem 'jquery_mask_rails' # more details at http://bit.ly/jquery-mask-gem
gem 'devise'
gem 'devise-i18n'
gem 'simple_form'
gem 'annotate'
gem 'geocoder'
gem 'gmaps4rails'
gem 'rack-cors', :require => 'rack/cors'
gem 'has_scope'
gem 'kaminari'
gem 'kaminari-bootstrap'
gem "figaro"
gem "sentry-raven"
gem 'enum_help'
gem "pundit"
gem 'gmaps4rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  # test suite
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'simplecov', require: false
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
  gem 'warden-rspec-rails'
  gem 'rails-controller-testing'
  gem 'capybara'
  gem 'poltergeist'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
  gem 'brakeman', :require => false
  gem "better_errors"
  gem "binding_of_caller"
  gem "rails-erd"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
