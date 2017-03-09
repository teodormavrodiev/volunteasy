class ChangeStatusColumnToRegistrations < ActiveRecord::Migration[5.0]
  def change
    remove_column :registrations, :status
    add_column :registrations, :status, :integer, default: 0
  end
end
