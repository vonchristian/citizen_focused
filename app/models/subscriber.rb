class Subscriber < ApplicationRecord
  belongs_to :province, class_name: "Addresses::Province"
  validates :name, presence: true, uniqueness: { scope: :province_id }
end
