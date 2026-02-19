RSpec.configure do |config|
  config.before(:each, type: :system) do
    browser = ENV["CI"] ? :headless_chrome : :chrome
    driven_by :selenium, using: browser, screen_size: [ 1400, 800 ]
  end
end
