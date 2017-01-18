require 'rails_helper'

RSpec.describe Business, type: :model do
  describe "associations" do
    it { is_expected.to have_one :capital }
    it { is_expected.to belong_to :taxpayer }
    it { is_expected.to belong_to :type_of_organization }
    it { is_expected.to have_many :addresses }

  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :asset_size }
    it { is_expected.to validate_presence_of :employee_count }
    it do
      is_expected.to validate_numericality_of(:employee_count).is_greater_than_or_equal_to(1)
    end

  end
end
