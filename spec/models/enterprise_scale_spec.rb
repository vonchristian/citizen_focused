require 'rails_helper'

RSpec.describe EnterpriseScale, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :minimum }
    it { is_expected.to validate_presence_of :maximum }
    # it do
    #   is_expected.to validate_numericality_of(:minimum).is_less_than(:maximum)
    # end
  end
  it ".range" do
    enterprise_scale = create(:enterprise_scale, minimum: 100, maximum: 1_000)

    expect(enterprise_scale.range).to eql(100..1_000)
  end
end
