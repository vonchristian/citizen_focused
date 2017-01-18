require 'rails_helper'

RSpec.describe EnterpriseScale, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :minimum }
    it { is_expected.to validate_presence_of :maximum }
    # it do
    #   is_expected.to validate_numericality_of(:minimum).is_less_than(:maximum)
    # end
  end
  it "#range" do
    enterprise_scale = create(:enterprise_scale, minimum: 100, maximum: 1_000)

    expect(enterprise_scale.range).to eql(100..1_000)
  end
  it ".set_enterprise_scale(business)" do
    enterprise_scale_1 = create(:enterprise_scale, minimum: 100, maximum: 1_000)
    enterprise_scale_2 = create(:enterprise_scale, minimum: 100_000, maximum: 1_000_000)
    business = create(:business, asset_size: 100)
    EnterpriseScale.set_enterprise_scale(business)

    expect(business.enterprise_scale).to eql(enterprise_scale_1)
    expect(business.enterprise_scale).to_not eql(enterprise_scale_2)
  end
end
