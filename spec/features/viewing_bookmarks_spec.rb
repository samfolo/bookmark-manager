RSpec.feature 'viewing bookmarks' do
  scenario 'user wishes to view bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'Name'
    expect(page).to have_content 'URL'
  end
end