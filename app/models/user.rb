# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  account    :string(255)
#  psw        :string(255)
#  json       :text
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :account, :json, :name, :psw
  has_many :emails
  validates :name, length: {minimum: 2}
  validates :psw, :presence => true
  validates :json, :presence => true
  validates :account, :presence => true
end
