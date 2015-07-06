
require 'rails_helper'

feature 'Add new list', js: true do
given!(:user) { FactoryGirl.create(:user) }
 
  before do
    login_as user
    visit root_path
  end
  scenario 'user creates new list successfully' do
    
     click_button 'Add TODO List'
     fill_in 'New list', with: 'new_list'
     click_button 'Add'
    expect(page).to have_content("new_list")
  end


end