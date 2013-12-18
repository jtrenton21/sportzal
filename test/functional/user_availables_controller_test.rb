require 'test_helper'

class UserAvailablesControllerTest < ActionController::TestCase
  setup do
    @user_available = user_availables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_availables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_available" do
    assert_difference('UserAvailable.count') do
      post :create, user_available: {  }
    end

    assert_redirected_to user_available_path(assigns(:user_available))
  end

  test "should show user_available" do
    get :show, id: @user_available
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_available
    assert_response :success
  end

  test "should update user_available" do
    put :update, id: @user_available, user_available: {  }
    assert_redirected_to user_available_path(assigns(:user_available))
  end

  test "should destroy user_available" do
    assert_difference('UserAvailable.count', -1) do
      delete :destroy, id: @user_available
    end

    assert_redirected_to user_availables_path
  end
end
