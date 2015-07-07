require 'rails_helper'

RSpec.describe TasksController, type: :controller do
 let(:user) { FactoryGirl.create(:user) }
 let(:task_params) { FactoryGirl.attributes_for(:task).stringify_keys }
 let(:list) { FactoryGirl.create(:list, user: user) }

  before do
    create_ability!
    controller.stub(:current_user).and_return user
  end

 

  describe 'POST #create' do
 
    it 'creates successful' do
      post :create, format: :json,list_id: list.id, task: task_params
      response.should be_success
    end
  end

  describe 'PATCH #update' do
    let(:task) { FactoryGirl.create(:task, user: user, list: list) }
    context 'update' do
       
      it 'renders nothing' do
        patch :update, format: :json,list_id: list.id, id: task.id, task: { body: "xyz"}
        expect(response.body).to eq ''
      end
    end

  end

  describe 'DELETE #destroy' do
    let(:task) { FactoryGirl.create(:task, user: user, list: list) }
    context 'with valid params' do
     
      it 'returns nothing' do
        delete :destroy, format: :json,list_id: list.id, id: task.id
        expect(response.body).to eq ''
      end
    
      it 'response with 204' do
        delete :destroy, format: :json,list_id: list.id, id: task.id
        expect(response.status).to eq(204)
      end
    end
  end

end