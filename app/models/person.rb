class Person < ApplicationRecord
  validates :firstname, :lastname, :groupname, :role, presence: true      
  validates :firstname, :lastname, :groupname,  format: { with: /\A[a-zA-Z]+\z/, message: "should contain letters only" }
  ROLES = ['Organizer', 'Presenter', 'Participant']
  validates :role, inclusion: { in: ROLES, message: "valid values: orgainizer, presenter and participant"}
  has_many :memberships
  has_many :eventgroups, through: :memberships

  validate :unique_person_membership
  private

  def unique_person_membership
    # Check if there is any person with the same firstname, lastname, and groupname in the people table
    existing_person = Person.find_by(firstname: firstname, lastname: lastname, groupname: groupname)

    # If the person with the same attributes exists and it has a different ID (i.e., it's not the same person being updated),
    # add an error indicating that a person with the same firstname, lastname, and groupname already exists.
    if existing_person && existing_person.id != id
      errors.add(:base, "A person with the same first name, last name, and group name already exists")
    end
  end

end
