require 'rails_helper'

module Addresses
  describe Barangay do
    describe "associations" do
      it { is_expected.to belong_to :subscriber }
    end
    describe "validations" do
      it { is_expected.to validate_presence_of :name }
      it do
        is_expected.to validate_uniqueness_of(:name).scoped_to(:subscriber_id)
      end
    end
  end
end
