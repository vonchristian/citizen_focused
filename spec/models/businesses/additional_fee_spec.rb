require 'rails_helper'

module Businesses
  describe AdditionalFee do
    describe "associations" do
      it { is_expected.to belong_to :business }
      it { is_expected.to belong_to :fee }
    end
  end
end
