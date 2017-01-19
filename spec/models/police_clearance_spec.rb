require 'rails_helper'

RSpec.describe PoliceClearance, type: :model do
  describe "associations" do
    it { is_expected.to have_one :police_clearance_fee }
  end
  describe "nested_attributes" do
    it { is_expected.to accept_nested_attributes_for(:police_clearance_fee)}
  end
end
