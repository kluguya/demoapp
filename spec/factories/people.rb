# spec/factories/people.rb
FactoryBot.define do
  factory :person do
    firstname { Faker::Name.first_name.gsub(/\W/, '').gsub("\u0000", '') }
    lastname { Faker::Name.last_name.gsub(/\W/, '').gsub("\u0000", '') }
    groupname { ['Theta', 'Omega', 'Beta', 'Alpha'].sample }
    role { ['Presenter', 'Organizer', 'Participant'].sample }

    # Define the :with_eventgroups trait
    trait :with_eventgroups do
      after(:create) do |person|
        # Loop until we create a person with a unique combination of firstname, lastname, and groupname
        loop do
          # Check if the person exists with the same firstname, lastname, and groupname
          existing_person = Person.find_by(firstname: person.firstname, lastname: person.lastname, groupname: person.groupname)

          if existing_person
            # If the person already exists, break the loop and skip the creation
            break
          else
            # Otherwise, create the person and associate with a new eventgroup
            eventgroup = FactoryBot.create(:eventgroup, name: person.groupname)
            person.eventgroups << eventgroup
            person.save
            break
          end
        end
      end
    end
  end
end