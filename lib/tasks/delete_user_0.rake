namespace :db do
  desc "Delete users with id of 0 from the database"
  task delete_users_with_id_0: :environment do
    User.all.where('users.id IN (?)',[0]).destroy_all
  end
end


