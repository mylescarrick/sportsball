source "https://rubygems.org"
ruby '2.3.1'

path "components" do
  gem "app"
  gem "predictor"
end


#Ensuring correct version of transitive dependency
gem "trueskill", git: "https://github.com/benjaminleesmith/trueskill", ref: "e404f45af5b3fb86982881ce064a9c764cc6a901"

gem 'rails', '5.0.0.1'
gem 'sass-rails', '~> 5.0.6'
gem 'uglifier', '>= 1.3.0'
# gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.6'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'puma'

group :development, :test do
  gem 'sqlite3'
  gem 'spring'
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', :require => false
  gem 'capybara'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
