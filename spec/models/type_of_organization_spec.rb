require 'rails_helper'

RSpec.describe TypeOfOrganization, type: :model do
  describe "associations" do
  end
  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end
end
