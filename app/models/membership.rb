class Membership < ApplicationRecord
    belongs_to :person
    belongs_to :eventgroup
    validates_uniqueness_of :person_id, scope: :eventgroup_id
end
