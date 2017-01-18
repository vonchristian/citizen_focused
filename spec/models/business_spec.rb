require 'rails_helper'

RSpec.describe Business, type: :model do
  describe "associations" do
    it { is_expected.to have_one :capital }
    it { is_expected.to belong_to :taxpayer }
    it { is_expected.to belong_to :type_of_organization }
    it { is_expected.to belong_to :enterprise_scale }
    it { is_expected.to have_many :addresses }
    it { is_expected.to have_many :gross_sales }
    it { is_expected.to have_many :business_activities }
    it { is_expected.to have_many :line_of_businesses }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :asset_size }
    it { is_expected.to validate_presence_of :employee_count }
    it do
      is_expected.to validate_numericality_of(:employee_count).is_greater_than_or_equal_to(1)
    end
  end
  it "set_enterprise_scale" do
    enterprise_scale = create(:enterprise_scale, minimum: 100, maximum: 1_000)
    business = create(:business, asset_size: 100)
    expect(business.enterprise_scale).to eql(enterprise_scale)
  end
end
