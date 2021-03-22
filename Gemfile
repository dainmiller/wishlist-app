source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 6.1.3'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'pry'
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'main'
  end
end

group :test do
	gem "capybara"
  # gem "factory_bot_rails"
  # gem "shoulda-matchers", require: false
	# gem "capybara-selenium"
	# gem "capybara_discoball"
	# gem "climate_control"
	# gem "database_cleaner"
	# gem "email_spec"
	# gem "launchy"
	# gem "rails-controller-testing"
	# gem "rspec_junit_formatter"
	# gem "simplecov", require: false
	# gem "sinatra"
	# gem "timecop"
	# gem "webdrivers"
	# gem "webmock"
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'spring-commands-rspec'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

