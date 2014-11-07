# == Schema Information
#
# Table name: emails
#
#  id         :integer          not null, primary key
#  eid        :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Email < ActiveRecord::Base
  belongs_to :user
  has_many :events
  attr_accessible :eid, :user_id

end
