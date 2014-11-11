class RenameDataBaseColumn < ActiveRecord::Migration
  def change
    rename_column :events, :shedule , :schedule
  end
end
