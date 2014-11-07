class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :schedule
      t.string :label
      t.references :email

      t.timestamps
    end
    add_index :events, :email_id
  end
end
