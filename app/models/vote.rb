class Vote < ActiveRecord::Base

  validates_presence_of :user_id, :talk_id
  validates :upvote_count, numericality: { only_integer: true }, allow_blank: true
  validates :downvote_count, numericality: { only_integer: true }, allow_blank: true
  validates :total, numericality: { only_integer: true }, allow_blank: true

  belongs_to :user
  belongs_to :talk

end
