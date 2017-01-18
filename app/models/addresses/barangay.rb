module Addresses
  class Barangay < ApplicationRecord
    belongs_to :subscriber, class_name: "Subscriber", foreign_key: 'subscriber_id'
    validates :name, presence: true, uniqueness: { scope: :subscriber_id }
  end
end
