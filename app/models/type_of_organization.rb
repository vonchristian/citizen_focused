class TypeOfOrganization < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
