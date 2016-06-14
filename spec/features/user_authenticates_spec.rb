require 'rails_helper'

feature 'user authenticates' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'user signs in' do
    visit root_path
    click_link 'Sign In'

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"

    expect(page).to have_content "Signed in as #{user.username}"
    expect(page).to have_content "Members only page"
  end

  scenario 'user fails to signs in' do
    visit root_path
    click_link 'Sign In'

    fill_in "Username", with: user.username
    fill_in "Password", with: "asdf"
    click_button "Sign In"

    expect(page).to have_content "Username and password incorrect"
  end

  scenario 'user signs out' do
    visit root_path
    click_link 'Sign In'

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"
    click_link "Sign Out"

    expect(page).to have_content "You have successfully signed out"
    expect(page).to have_content "Baller landing page"
  end
end
