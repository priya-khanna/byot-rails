class Talk < ActiveRecord::Base

  validates_presence_of :user_id, :byot_schedule_id, :name, :source_url
  validates :user_id, uniqueness: { scope: :byot_schedule_id, message: 'has already submitted talk for this BYOT' }

  belongs_to :user
  belongs_to :byot_schedule
  has_many :votes
end
