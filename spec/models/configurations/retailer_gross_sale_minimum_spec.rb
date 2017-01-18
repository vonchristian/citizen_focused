require 'rails_helper'

module Configurations
  describe RetailerGrossSaleMinimum do
    describe "validations" do
      it { is_expected.to validate_presence_of :amount }
      it { is_expected.to validate_numericality_of :amount }
    end
  end
end
