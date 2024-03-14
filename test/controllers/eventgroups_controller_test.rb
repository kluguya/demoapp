require "test_helper"

class EventgroupsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers  # Include Devise test helpers

  setup do
    @user = users(:one)  # Assuming you have a fixture for users
    sign_in @user
    #sign_out @user  
  end

  setup do
    @eventgroup = eventgroups(:one)
  end

  test "should get index" do
    get eventgroups_url
    assert_response :success
  end

  test "should get new" do
    get new_eventgroup_url
    assert_response :success
  end

  test "should create eventgroup" do
    assert_difference("Eventgroup.count") do
      post eventgroups_url, params: { eventgroup: { name: 'newgroupname' } }
    end

    assert_redirected_to eventgroup_url(Eventgroup.last)
  end

  test "should show eventgroup" do
    get eventgroup_url(@eventgroup)
    assert_response :success
  end

  test "should get edit" do
    get edit_eventgroup_url(@eventgroup)
    assert_response :success
  end

  test "should update eventgroup" do
    patch eventgroup_url(@eventgroup), params: { eventgroup: { name:'eventgroupname' } }
    assert_redirected_to eventgroup_url(@eventgroup)
  end

  test "should destroy eventgroup" do
    assert_difference("Eventgroup.count", -1) do
      delete eventgroup_url(@eventgroup)
    end

    assert_redirected_to eventgroups_url
  end
end
