require 'rails_helper'

module Businesses
  describe BusinessActivity do
    describe "associations" do
      it { is_expected.to belong_to :business }
      it { is_expected.to belong_to :line_of_business }
    end
  end
end
