source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'activesupport'
gem 'aws-sdk-sns', '1.21.0'

group :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'activerecord'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pg'
  gem 'pry'
  gem 'rspec', '~> 3.9'
end

group :development, :test do
  gem 'rubocop', '~> 0.59.2', require: false
end