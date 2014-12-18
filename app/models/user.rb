# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  psw                    :string
#  account                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  provider               :string
#  uid                    :string
#  token                  :string
#

require 'omniauth'
class User < ActiveRecord::Base
  #attr_accessible :name, :account, :psw  
  #attr_accessible :email, :password, :password_confirmation
  has_many :mygmails
  has_many :events , :through => :mygmails

  
  
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
      data = access_token.info
      user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    
      if user
        user.token = access_token["credentials"]["token"]
        return user
      else
        registered_user = User.where(:email => access_token.info.email).first
        if registered_user
          registered_user.token = access_token["credentials"]["token"]
          return registered_user
        else
          user = User.create(
            name: data["name"],
            provider:access_token.provider, 
            email: data["email"],
            uid: access_token.uid,
            token: access_token["credentials"]["token"],
            password: Devise.friendly_token[0,20],
          )
        end
     end
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

     
         
end
