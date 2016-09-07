Gem::Specification.new do |s|
  s.name        = "app"
  s.version     = "0.0.1"
  s.authors     = ["The CBRA Book"]
  s.summary     = "CBRA component"

  s.test_files = Dir["spec/**/*"]
  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "5.0.0.1"
  s.add_dependency "slim-rails", "3.1.1"
  s.add_dependency "trueskill"
  s.add_dependency "jquery-rails", "4.2.1"
  s.add_dependency "rails-controller-testing"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rails-controller-testing"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "capybara"
end
