class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new]

  # GET /campaigns
  def index
    if params[:tag]
      @campaigns = Campaign.tagged_with(params[:tag])
    elsif params[:category_id]
      @campaigns = Campaign.all.where(category_id: params[:category_id])
    else
      @campaigns = Campaign.all
    end
  end

  # GET /campaigns/1
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
    all_tags = ActsAsTaggableOn::Tagging.includes(:tag).where(taggable_type: 'Campaign').map(&:tag)
    #= "'dsa','ds'"
    @comma_tags_string = all_tags.map{|t| "'#{t.name}'" }.join(',')

    if current_user.balanced_account_uri.present?
      @bank_details = nil #bake call to xyz
    end
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user_id = current_user.id
    @user = @campaign.user
    if params[:balancedBankAccountURI].present?
      @user.update_attributes(balanced_account_uri: params[:balancedBankAccountURI])
    end

    if verify_recaptcha(@campaign) && @user.balanced_account_uri.present? && @campaign.save!
        # Tell the UserMailer to send a welcome email after save
        CampaignMailer.welcome_email(@user).deliver
      redirect_to @campaign, notice: 'Campaign was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /campaigns/1
  def update
    if @campaign.update(campaign_params)
      redirect_to @campaign, notice: 'Campaign was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /campaigns/1
  def destroy
    @campaign.destroy
    redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def campaign_params
      params.require(:campaign).permit(:title, :info, :days, :target, :start_date, :user_id, :banner, :video, :category_id, :socialplug, :tag_list)
    end
end
