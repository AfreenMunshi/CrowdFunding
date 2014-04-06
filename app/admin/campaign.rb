ActiveAdmin.register Campaign do

  permit_params :title, :info, :days, :target, :user_id, :created_at, :updated_at, :banner_file_name, :banner_content_type,
        :banner_file_size, :banner_updated_at, :video_file_name, :video_content_type, :video_file_size, :video_updated_at,
        :collected, :category_id, :socialplug, :first_reward, :highest_reward, :order_uri, :bank_uri, :closed_date, :closed_reason, :approved

  scope :all

  scope :approved_campaigns, :default => true do |calls|
    calls.where(approved: 1)
  end

  scope :unapproved_campaigns do |calls|
    calls.where(approved: 0)
  end


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
    column :approved if params['scope'] == 'all'
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
