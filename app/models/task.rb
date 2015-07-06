class Task < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  validates :body, presence: true
  before_save :default_upvotes
  
  def as_json(options = {})
    super(options.merge(include: :user))
  end
  def default_upvotes
  	self.upvotes = self.list.tasks.size + 1
  end	

end
