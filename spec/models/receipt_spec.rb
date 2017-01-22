require 'rails_helper'

RSpec.describe Receipt, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :receiptable }
  end
end
