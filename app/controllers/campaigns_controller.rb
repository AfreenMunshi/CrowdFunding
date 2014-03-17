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

  def vote_for_campaign
    binding.pry
      @campaign = Campaign.find(params[:id])
      current_user.vote_for(@campaign)
      redirect_to :back
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
    all_tags = ActsAsTaggableOn::Tagging.includes(:tag).where(taggable_type: 'Campaign').map(&:tag)

    @comma_tags_string = all_tags.map{|t| "'#{t.name}'" }.join(',')
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user_id = current_user.id

    if verify_recaptcha(@campaign) && params[:balancedBankAccountURI].present? && @campaign.save!
      @campaign.add_details(params[:balancedBankAccountURI])
      # Tell the UserMailer to send a welcome email after save
      CampaignMailer.welcome_email(@campaign.user).deliver
      redirect_to campaign_path(I18n.locale, @campaign.id), notice: 'Campaign was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /campaigns/1
  def update
    if @campaign.update(campaign_params)
      redirect_to campaign_path(I18n.locale, @campaign.id), notice: 'Campaign was successfully updated.'
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
      params.require(:campaign).permit(:title, :info, :days, :target, :user_id, :banner, :video, :category_id, :socialplug, :tag_list, :Thumbs_up, :first_reward, :highest_reward) if params[:campaign]
    end
end
