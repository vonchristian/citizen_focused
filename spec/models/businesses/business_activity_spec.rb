require 'rails_helper'

module Businesses
  describe BusinessActivity do
    describe "associations" do
      it { is_expected.to belong_to :business }
      it { is_expected.to belong_to :line_of_business }
      it { is_expected.to have_many :gross_sales }
    end

    describe "delegations" do
      it do
        is_expected.to(delegate_method(:name).to(:line_of_business).with_prefix)
      end
    end
  end
end
