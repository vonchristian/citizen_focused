require 'rails_helper'

RSpec.describe LineOfBusiness, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :line_of_business_category }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end

end
