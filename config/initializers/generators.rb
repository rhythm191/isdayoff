# rails generator config

Rails.application.config.generators do |g|
  g.test_framework :rspec, view_specs: false, helper_specs: false, fixture: true
  g.fixture_replacement :factory_girl, dir: 'spec/support/factories'
end