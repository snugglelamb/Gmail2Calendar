# == Schema Information
#
# Table name: mygmails
#
#  id         :integer          not null, primary key
#  eid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Mygmail < ActiveRecord::Base
  has_many :events
end
