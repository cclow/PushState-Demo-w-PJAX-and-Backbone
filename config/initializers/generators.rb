
Rails.application.config.generators do |g|
  g.test_framework :rspec, fixture: true, views: false
  g.fixture_replacement :factory_girl, dir: 'spec/factories'
  g.template_engine :haml
end
