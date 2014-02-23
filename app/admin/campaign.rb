ActiveAdmin.register Campaign do


 
 filter :user
 filter :category
 filter :tags
 filter :title
 filter :days
 filter :target
 filter :collected
 filter :created_at

  index do
    column :id
    column :title
    column :user, :sortable => :user
    column :info
    column :category, :sortable => :category
    column :days
    column :target
    column :collected
    column :created_at
    
    
    
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
