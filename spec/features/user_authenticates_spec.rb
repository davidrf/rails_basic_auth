require 'rails_helper'

feature 'user authenticates' do
  let!(:user) do
    User.create(
      username: 'tombrady',
      email: 'goat@gmail.com',
      password: 'password1'
    )
  end

  scenario 'user signs in successfully' do
    visit root_path
    click_link 'Sign In'

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('members only page')
    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')
  end

  scenario 'user does not sign in successfully' do
    visit root_path
    click_link 'Sign In'

    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'fjdsak;'
    click_button 'Sign In'

    expect(page).to have_content('Invalid username and password')
    expect(page).to have_content('Sign In')
  end

  scenario 'user signts out in successfully' do
    visit root_path
    click_link 'Sign In'

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_link 'Sign Out'

    expect(page).to have_content('landing page')
    expect(page).to have_content('Sign In')
  end
end
