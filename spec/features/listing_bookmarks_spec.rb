RSpec.feature 'listing bookmarks' do
  scenario 'it has a title' do
    visit '/bookmarks'
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'it has table headings' do
    visit '/bookmarks'
    expect(page).to have_selector 'th', text: 'Name'
    expect(page).to have_selector 'th', text: 'URL'
    expect(page).to have_selector 'table'
  end

  context 'hardcoded contents' do
    scenario 'it has default names' do
      visit '/bookmarks'

      expect(page).to have_content 'Google'
      expect(page).to have_content 'Reddit'
      expect(page).to have_content 'YouTube'
      expect(page).to have_content 'BBC News'
      expect(page).to have_content 'Cincinnati Zoo'
    end

    scenario 'it has default URLs' do
      visit '/bookmarks'

      expect(page).to have_content 'https://google.com'
      expect(page).to have_content 'https://reddit.com'
      expect(page).to have_content 'https://youtube.com'
      expect(page).to have_content 'https://bbc.co.uk/news'
      expect(page).to have_content 'http://cincinnatizoo.org'
    end
  end
end
