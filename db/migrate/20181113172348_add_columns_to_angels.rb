class AddColumnsToAngels < ActiveRecord::Migration[5.2]
  def change
    add_column :angels, :first_name, :string
    add_column :angels, :last_name, :string
    add_column :angels, :phone_number, :string
  end
end
