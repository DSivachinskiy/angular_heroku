
require 'rails_helper'

feature 'delete list', js: true do
 given!(:user) { FactoryGirl.create(:user) }
 given!(:list) { FactoryGirl.create(:list, user: user) }
  before do
    login_as user
    visit root_path
  end

  scenario 'user deletes list' do
    
    find('.glyphicon.glyphicon-remove').click
    expect(page).not_to have_content("new_list")
  end


end