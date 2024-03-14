require "application_system_test_case"

class EventgroupsTest < ApplicationSystemTestCase
  setup do
    @eventgroup = eventgroups(:one)
  end

  test "visiting the index" do
    visit eventgroups_url
    assert_selector "h1", text: "Eventgroups"
  end

  test "should create eventgroup" do
    visit eventgroups_url
    click_on "New eventgroup"

    fill_in "Name", with: @eventgroup.name
    click_on "Create Eventgroup"

    assert_text "Eventgroup was successfully created"
    click_on "Back"
  end

  test "should update Eventgroup" do
    visit eventgroup_url(@eventgroup)
    click_on "Edit this eventgroup", match: :first

    fill_in "Name", with: @eventgroup.name
    click_on "Update Eventgroup"

    assert_text "Eventgroup was successfully updated"
    click_on "Back"
  end

  test "should destroy Eventgroup" do
    visit eventgroup_url(@eventgroup)
    click_on "Destroy this eventgroup", match: :first

    assert_text "Eventgroup was successfully destroyed"
  end
end
