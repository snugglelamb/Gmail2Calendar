# == Schema Information
#
# Table name: mygmails
#
#  id         :integer          not null, primary key
#  eid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'test_helper'

class MygmailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
