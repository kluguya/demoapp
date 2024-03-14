require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers  # Include Devise test helpers

  setup do
    @person = FactoryBot.create(:person)
    assert @person.valid?
    @user = users(:one)  # Assuming you have a fixture for users
    sign_in @user
    #sign_out @user   
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference("Person.count") do
      post people_url, params: { person: { firstname: 'personfirstname', groupname: 'persongroupname', lastname: 'personlastname', role: 'Participant' } }
      # should fail - post people_url, params: { person: { firstname: @person.firstname, groupname: @person.groupname, lastname: @person.lastname, role: @person.role } }
    end

    assert_redirected_to person_url(Person.last)
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { firstname: @person.firstname, groupname: @person.groupname, lastname: @person.lastname, role: @person.role } }
    assert_redirected_to person_url(@person)
  end

  test "should destroy person" do
    assert_difference("Person.count", -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
