class AddOrganizationBioToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :organization_bio, :text
  end
end
