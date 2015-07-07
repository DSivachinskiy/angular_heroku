
require 'rails_helper'
 include OmniauthHelper
feature "Registration", js: true do
  scenario "Visitor registers successfully via register form" do
    visit '#/register'
    fill_in 'Email', with: "johnny@mail.ru"
    fill_in 'Username', with: "Ring"     
    fill_in'Password', with: '12345678'
    click_button('Register')
    
    expect(page).to have_content 'Log Out'
    expect(page).to have_content 'Ring'

    expect(page).not_to have_content 'Register'
    expect(page).not_to have_content 'Log In'
    
  end
   scenario 'Visitor cant register if form empty' do
    visit '#/register'

    fill_in 'Email', with: ''
    fill_in 'Username', with: ''
    fill_in 'Password', with: ''

    click_button('Register')
    expect(page).not_to have_content 'Log Out'
    
  end
   scenario 'login via facebook' do
    visit '#/home'

   set_omniauth
    click_link 'facebook_link'
    expect(page).to have_content 'Log Out'
  end
end
