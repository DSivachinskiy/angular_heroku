
require 'rails_helper'
 
describe Task do
  let(:task) { Task.new }
 
  it { expect(task).to validate_presence_of(:body) }

  it { should belong_to :user }
  it { should belong_to :list }
end