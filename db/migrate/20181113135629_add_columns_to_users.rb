class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :login, :string
    add_column :users, :car_model, :string
    add_column :users, :car_plate, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
  end
end
