require 'rails_helper'

module Businesses
  describe Capital do
    describe "associations" do
      it { is_expected.to belong_to :business }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of :amount }
      it do
        is_expected.to validate_numericality_of(:amount).is_greater_than(0.1)
      end
    end
  end
end
