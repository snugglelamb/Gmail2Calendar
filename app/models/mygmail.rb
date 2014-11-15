# == Schema Information
#
# Table name: mygmails
#
#  id         :integer          not null, primary key
#  eid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  content    :text
#

class Mygmail < ActiveRecord::Base
  has_many :events
  belongs_to :users
end
