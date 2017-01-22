require 'rails_helper'

RSpec.describe Fee, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :feeable }
    it { is_expected.to belong_to :account }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
  end

  it ".default" do
    fee_1 = create(:fee, default: true)
    fee_2 = create(:fee, default: false)

    expect(Fee.default).to include(fee_1)
    expect(Fee.default).to_not include(fee_2)
  end

  it ".not_default" do
    fee_1 = create(:fee, default: false)
    fee_2 = create(:fee, default: true)

    expect(Fee.not_default).to include(fee_1)
    expect(Fee.not_default).to_not include(fee_2)
  end
end
