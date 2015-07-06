
require 'rails_helper'

feature 'add new task', js: true do
 given!(:user) { FactoryGirl.create(:user) }
 given!(:list) { FactoryGirl.create(:list, user: user) }
  before do
    login_as user
    visit root_path
  end
  scenario 'user creates new task successfully' do
    

    fill_in 'Task', with: 'new_task'
     click_button('Add')
    expect(page).to have_content("new_task")
  end


end