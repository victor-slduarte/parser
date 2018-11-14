class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :angels, :user, foreign_key: true
  end
end
