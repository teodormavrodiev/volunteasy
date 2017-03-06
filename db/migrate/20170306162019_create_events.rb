class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :organization
      t.datetime :start_time
      t.datetime :end_time
      t.string :address
      t.integer :capacity
      t.text :description
      t.integer :source_event_id
      t.text :tags, array: true, default: []

      t.timestamps
    end
  end
end
