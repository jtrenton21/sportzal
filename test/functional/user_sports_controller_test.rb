require 'test_helper'

class UserSportsControllerTest < ActionController::TestCase
  setup do
    @user_sport = user_sports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_sports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_sport" do
    assert_difference('UserSport.count') do
      post :create, user_sport: { experience: @user_sport.experience, skill_level: @user_sport.skill_level }
    end

    assert_redirected_to user_sport_path(assigns(:user_sport))
  end

  test "should show user_sport" do
    get :show, id: @user_sport
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_sport
    assert_response :success
  end

  test "should update user_sport" do
    put :update, id: @user_sport, user_sport: { experience: @user_sport.experience, skill_level: @user_sport.skill_level }
    assert_redirected_to user_sport_path(assigns(:user_sport))
  end

  test "should destroy user_sport" do
    assert_difference('UserSport.count', -1) do
      delete :destroy, id: @user_sport
    end

    assert_redirected_to user_sports_path
  end
end
