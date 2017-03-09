class AddNotifiableToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :notifiable, :boolean, default: false
  end
end
