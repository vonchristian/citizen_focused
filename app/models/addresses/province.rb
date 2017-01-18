module Addresses
  class Province < ApplicationRecord
    has_many :city_or_municipalities, class_name: "Subscriber"
    
    validates :name, presence: true, uniqueness: true

  end
end
