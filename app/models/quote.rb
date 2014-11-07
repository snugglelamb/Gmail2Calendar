class Quote < ActiveRecord::Base
  belongs_to :user
  attr_accessible :review, :user_id
  validates :user_id, presence: true, numericality: {greater_than: 0}
end
