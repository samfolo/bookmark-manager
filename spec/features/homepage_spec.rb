RSpec.feature 'homepage' do
  scenario 'user visits the homepage' do
    visit '/'

    expect(page).to have_content 'Bookmark Manager'
    expect(page).to have_content 'Name'
    expect(page).to have_content 'URL'
  end
end
