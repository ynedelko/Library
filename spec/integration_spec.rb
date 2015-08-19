require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exeptions, false)

describe('the whole library', {:type => :feature}) do
  it('displays the catalog of books and authors') do
    visit('/')
    expect(page).to have_content('Welcome')
  end
end
