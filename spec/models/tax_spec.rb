require 'rails_helper'

RSpec.describe Tax, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :taxable }
  end
end
