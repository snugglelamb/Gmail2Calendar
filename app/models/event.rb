# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  location   :string(255)
#  schedule   :datetime
#  label      :string(255)
#  email_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ActiveRecord::Base
  belongs_to :email
  attr_accessible :label, :location, :name, :schedule
end
