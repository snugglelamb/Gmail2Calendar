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

require 'rails_helper'

RSpec.describe Mygmail, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
