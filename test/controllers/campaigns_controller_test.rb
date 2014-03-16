require 'test_helper'

class CampaignsControllerTest < ActionController::TestCase
  setup do
    @campaign = campaigns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campaigns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campaign" do
    assert_difference('Campaign.count') do
      post :create, campaign: { days: @campaign.days, info: @campaign.info, start_date: @campaign.start_date, target: @campaign.target, title: @campaign.title }
    end

    assert_redirected_to campaign_path(I18n.localeassigns(:campaign))
  end

  test "should show campaign" do
    get :show, id: @campaign
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @campaign
    assert_response :success
  end

  test "should update campaign" do
    patch :update, id: @campaign, campaign: { days: @campaign.days, info: @campaign.info, start_date: @campaign.start_date, target: @campaign.target, title: @campaign.title }
    assert_redirected_to campaign_path(I18n.locale,assigns(:campaign))
  end

  test "should destroy campaign" do
    assert_difference('Campaign.count', -1) do
      delete :destroy, id: @campaign
    end

    assert_redirected_to campaigns_path(I18n.locale)
  end
end
