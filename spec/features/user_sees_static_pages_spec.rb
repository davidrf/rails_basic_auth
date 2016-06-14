require 'rails_helper'

feature 'user sees static pages' do
  scenario 'user sees landing page at root' do
    visit root_path
    expect(page).to have_content 'Baller landing page'
  end
end
