class CreateMygmails < ActiveRecord::Migration
  def change
    create_table :mygmails do |t|
      t.string :eid

      t.timestamps null: false
    end
  end
end
