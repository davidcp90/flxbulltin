require "test_helper"

class UserBulletinActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_bulletin_activity = user_bulletin_activities(:one)
  end

  test "should get index" do
    get user_bulletin_activities_url, as: :json
    assert_response :success
  end

  test "should create user_bulletin_activity" do
    assert_difference("UserBulletinActivity.count") do
      post user_bulletin_activities_url, params: { user_bulletin_activity: { ack: @user_bulletin_activity.ack, bulletin_id: @user_bulletin_activity.bulletin_id, user_id: @user_bulletin_activity.user_id, viewed: @user_bulletin_activity.viewed } }, as: :json
    end

    assert_response :created
  end

  test "should show user_bulletin_activity" do
    get user_bulletin_activity_url(@user_bulletin_activity), as: :json
    assert_response :success
  end

  test "should update user_bulletin_activity" do
    patch user_bulletin_activity_url(@user_bulletin_activity), params: { user_bulletin_activity: { ack: @user_bulletin_activity.ack, bulletin_id: @user_bulletin_activity.bulletin_id, user_id: @user_bulletin_activity.user_id, viewed: @user_bulletin_activity.viewed } }, as: :json
    assert_response :success
  end

  test "should destroy user_bulletin_activity" do
    assert_difference("UserBulletinActivity.count", -1) do
      delete user_bulletin_activity_url(@user_bulletin_activity), as: :json
    end

    assert_response :no_content
  end
end
