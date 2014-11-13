class AddUserRefToMygmails < ActiveRecord::Migration
  def change
    add_reference :mygmails, :user, index: true
  end
end
