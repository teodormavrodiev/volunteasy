class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :dob, :string
    add_column :users, :organization, :string
    add_column :users, :address, :string
  end
end
