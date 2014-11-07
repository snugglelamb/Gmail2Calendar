class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :account
      t.string :psw
      t.text :json
      t.string :name

      t.timestamps
    end
  end
end
