require 'rails_helper'

RSpec.describe LineOfBusiness, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :line_of_business_category }
    it { is_expected.to have_one :mayors_permit_fee }

  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end

  describe "nested_attributes" do
    it { is_expected.to accept_nested_attributes_for(:mayors_permit_fee) }
  end

end
