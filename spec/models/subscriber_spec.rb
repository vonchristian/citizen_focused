require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :province }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it do
      is_expected.to validate_uniqueness_of(:name).scoped_to(:province_id)
    end
  end

end
