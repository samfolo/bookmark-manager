RSpec.feature 'viewing bookmarks' do
  scenario 'user wishes to view bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'Bookmarks'
  end
end
