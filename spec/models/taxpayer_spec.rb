require 'rails_helper'

RSpec.describe Taxpayer, type: :model do
  describe "associations" do
    it { is_expected.to have_many :businesses }
    it { is_expected.to have_many :addresses }


  end
  describe "validations" do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :middle_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_uniqueness_of :full_name }
  end

  it "should set full name before being saved" do
    taxpayer = create(:taxpayer)
    expect(taxpayer.full_name).to_not be_nil
  end

end
