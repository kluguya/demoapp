class Eventgroup < ApplicationRecord
    validates :name, presence: true , uniqueness: true
    validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "should contain letters only" }

    has_many :memberships
    has_many :people, through: :memberships

    # Add a method to handle finding or creating an eventgroup by name
    def self.find_or_create_by_name(name)
      find_by(name: name) || create(name: name)
    end
end
