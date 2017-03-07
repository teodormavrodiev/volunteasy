class ChangeForeignKeys < ActiveRecord::Migration[5.0]
  def change
    rename_column :registrations, :user_id, :participant_id
    rename_column :events, :user_id, :organizer_id
  end
end
