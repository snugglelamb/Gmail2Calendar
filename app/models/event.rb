# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string
#  schedule   :datetime
#  location   :string
#  mygmail_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ActiveRecord::Base
  belongs_to :mygmail
  # attr_accessible :mygmail_id
end
