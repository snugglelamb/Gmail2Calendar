class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :schedule
      t.string :location
      t.references :mygmail, index: true

      t.timestamps null: false
    end
  end
end
