require "rails_helper"

RSpec.describe Eventgroup do
  it "has a name" do
    eventgroup = Eventgroup.create!(name: "Testgroup")
    expect(eventgroup.name).to eq("Testgroup")
  end
end