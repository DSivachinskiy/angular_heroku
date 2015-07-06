
require 'rails_helper'

feature 'delete task', js: true do
 given!(:user) { FactoryGirl.create(:user) }
 given!(:list) { FactoryGirl.create(:list, user: user) }
 given!(:task) { FactoryGirl.create(:task, user: user, list: list) }
  before do
    login_as user
    visit root_path
  end
  scenario 'user deletes task successfully' do
    

    find('.glyphicon.glyphicon-trash').click
     
    expect(page).to have_content("test_task")
  end


end