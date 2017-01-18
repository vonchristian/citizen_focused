require 'rails_helper'

module Addresses
  RSpec.describe Province, type: :model do
    describe "associations" do
      it { is_expected.to have_many(:city_or_municipalities) }
    end
    describe "validations" do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of :name }
    end
  end
end
