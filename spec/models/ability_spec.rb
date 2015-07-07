require 'rails_helper'
require 'cancan/matchers'

describe 'User' do
  describe 'abilities' do
    
    context 'when user signed in' do
      let(:user) { FactoryGirl.create(:user) }
     
      subject(:ability) { Ability.new(user) }

      it { expect(ability).to be_able_to(:manage, List.new) }
      it { expect(ability).to be_able_to(:manage, Task.new) }

    end
     context 'when user not signed in' do
      let(:costumer) { nil }
      subject(:ability) { Ability.new(costumer) }

      it { expect(ability).to be_able_to(:read, Task.new) }
      it { expect(ability).to be_able_to(:read, List.new) } 
      
      it { expect(ability).not_to be_able_to(:manage, List.new) }
      it { expect(ability).not_to be_able_to(:manage, Task.new) }
      

    end
  end
end