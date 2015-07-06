
require 'rails_helper'
 
describe List do
  let(:list) { List.new }
 
  it { expect(list).to validate_presence_of(:title) }

  it { should belong_to :user }
 
  it { should have_many :tasks }
end