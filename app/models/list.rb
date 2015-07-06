class List < ActiveRecord::Base
  has_many :tasks
  belongs_to :user
validates :title, presence: true
  def as_json(options = {})
    super(options.merge(include: [:user, tasks: {include: :user}]))
  end

end
