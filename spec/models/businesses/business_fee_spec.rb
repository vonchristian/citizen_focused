require 'rails_helper'

module Businesses
  describe BusinessFee, type: :model do
    describe "associations" do
      it { is_expected.to belong_to :business }
      it { is_expected.to belong_to :fee }
    end

    describe "validations" do
    end
  end
end
