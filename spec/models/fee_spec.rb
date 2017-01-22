require 'rails_helper'

RSpec.describe Fee, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :feeable }
    it { is_expected.to belong_to :account }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
  end

end
