ActiveAdmin.register Registration do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :participant_id, :event_id, :status

  index do
    selectable_column
    column :participant_id
    column :event_id
    column :status
    column :created_at
    actions
  end




#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
