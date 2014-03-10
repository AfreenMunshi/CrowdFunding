ActiveAdmin.register Transaction do

   
 filter :user
 filter :campaign
 filter :verified
 filter :target
 filter :amount
 
  index do
    column :user
    column :campaign
    column :verified
    column :target
    column :amount
    

    default_actions
  end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
