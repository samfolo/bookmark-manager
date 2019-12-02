RSpec.feature "Testing Server" do
  scenario "can access homepage" do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end
end
