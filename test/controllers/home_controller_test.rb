require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers  # Include Devise test helpers

  setup do
    @user = users(:one)  # Assuming you have a fixture for users
    sign_in @user
    #sign_out @user   
  end

  test "should get index" do
    get root_path  #homecontroller index action is set as root_path
    assert_response :success
  end
end
