RSpec.feature 'viewing bookmarks' do
  scenario 'user wishes to view bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'Name'
    expect(page).to have_content 'URL'
  end

  scenario 'user bookmarks various pages' do
    visit '/bookmarks'
    expect(page).to have_content 'https://google.com'
    expect(page).to have_content 'https://reddit.com'
  end
end