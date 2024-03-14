# db/seeds.rb
require 'faker'

# Load the Rails environment
require_relative '../config/environment'

# Array of event group names
eventgroup_names = ['Theta', 'Omega', 'Beta', 'Alpha']

# Create eventgroups based on the array of names, skipping if the name already exists
eventgroups = eventgroup_names.map do |name|
  Eventgroup.find_or_create_by(name: name)
end

# Define the number of people you want to create
number_of_people = 50

# Create people and associate them with event groups, skipping if the record already exists
number_of_people.times do
  firstname = Faker::Name.first_name.gsub(/\W/, '').gsub("\u0000", '')
  lastname = Faker::Name.last_name.gsub(/\W/, '').gsub("\u0000", '')
  groupname = eventgroup_names.sample

  Person.find_or_create_by(firstname: firstname, lastname: lastname, groupname: groupname) do |person|
    person.role = ['Presenter', 'Organizer', 'Participant'].sample
    person.eventgroups << eventgroups.find { |eventgroup| eventgroup.name == groupname }
  end
end
