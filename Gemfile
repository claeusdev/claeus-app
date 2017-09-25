source 'https://rubygems.org'

ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'sprockets-rails', '~> 3.2'

# Claeus gems

gem 'devise'
gem 'bourbon'
gem 'neat'
gem 'font-awesome-sass', '~> 4.7.0'
gem 'carrierwave', '~> 1.0'
gem 'haml', '~> 5.0', '>= 5.0.1'
gem 'simple_form', '~> 3.5'
gem 'country_select'
gem 'friendly_id', '~> 5.1.0'
gem 'social-share-button'
gem 'ancestry'
gem 'ransack'
gem 'kaminari'
gem 'normalize-rails'
gem 'webpacker', '~> 3.0'
# gem 'impressionist'
gem "fog-aws"
gem 'rmagick'



group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'faker'
end

group :production  do
  gem 'rails_12factor'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]