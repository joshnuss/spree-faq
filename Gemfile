source 'http://rubygems.org'

gem 'sqlite3'

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'libnotify'
end

group :test do
  gem 'rspec-rails', '= 2.6.1'
  gem 'faker'
  gem 'factory_girl'
end

if RUBY_VERSION < "1.9"
  gem "ruby-debug"
else
  gem "ruby-debug19"
end

gemspec
