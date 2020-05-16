require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('create an word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    # save_and_open_page
    fill_in('word_name', :with => 'Tired')
    click_on('Create New Word')
    expect(page).to have_content('Tired')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    word = Word.new({:name => "Nutrition", :id => nil})
    word.save
    visit("/words/#{word.id}/definitions")
    # save_and_open_page
    fill_in('word_definition', :with => 'the act of being nourished')
    click_on('Add New Definition')
    expect(page).to have_content('the act of being nourished')
  end
end