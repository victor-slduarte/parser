class AddBooleanToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :danger_status, :boolean, default: false
  end
end
