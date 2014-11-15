class AddContentToMygmails < ActiveRecord::Migration
  def change
    add_column :mygmails, :content, :text
  end
end
