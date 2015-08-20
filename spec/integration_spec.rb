require('spec_helper')
require('capybara/rspec')
require('./app')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exeptions, false)

describe('the whole library', {:type => :feature}) do
  it('displays the catalog of books and authors') do
    visit('/')
    expect(page).to have_content('Welcome')
  end

  it('adds books to the catalog list') do
    visit('/')
    fill_in('title', :with => 'Happiness')
    click_button('Add Book')
    expect(page).to have_content('Happiness')
  end

  it('displays information about the chosen book') do
    test_book = Book.new({:title => 'Where The Wild Things Are', :id => nil})
    test_book.save()
    visit("/book/#{test_book.id()}")
    expect(page).to have_content("Where The Wild Things Are")
  end

  it('edits the name of the chosen book') do
    test_book = Book.new({:title => 'Where The Wild Things Are', :id => nil})
    test_book.save()
    visit("/book/#{test_book.id()}/edit")
    fill_in('title', :with => "Everybody Poops")
    click_button('Rename')
    expect(page).to have_content("Everybody Poops")
  end

  it('deletes the name of the chosen book') do
    test_book = Book.new({:title => 'The Giving Tree', :id => nil})
    test_book.save()
    visit("/book/#{test_book.id()}/edit")
    click_button('Delete Book')
    expect(page).to have_no_content('The Giving Tree')
  end
end
