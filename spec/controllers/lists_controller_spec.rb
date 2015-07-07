require 'rails_helper'

RSpec.describe ListsController, type: :controller do
 let(:user) { FactoryGirl.create(:user) }
 let(:list_params) { FactoryGirl.attributes_for(:list).stringify_keys }
  

  before do
    create_ability!
    controller.stub(:current_user).and_return user
  end

  describe 'GET #index' do
    let(:list) { FactoryGirl.create(:list, user: user) }
    it 'assigns lists' do

      get :index, format: :json
      expect(assigns(:lists)).to eq([list])
    end

  end

  describe 'POST #create' do
 
    it 'creates successful' do
      post :create, format: :json, list: list_params
      response.should be_success
    end
  end

  describe 'PATCH #update' do
    let(:list) { FactoryGirl.create(:list, user: user) }
    context 'update' do
       
      it 'renders nothing' do
        patch :update, format: :json, id: list.id, list: { title: "xyz"}
        expect(response.body).to eq ''
      end
    end

  end

  describe 'DELETE #destroy' do
    let(:list) { FactoryGirl.create(:list, user: user) }
    context 'with valid params' do
     
      it 'returns nothing' do
        delete :destroy, format: :json, id: list.id
        expect(response.body).to eq ''
      end
    
      it 'response with 204' do
        delete :destroy, format: :json, id: list.id
        expect(response.status).to eq(204)
      end
    end
  end

end