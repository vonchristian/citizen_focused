require 'rails_helper'

module Accounting
  describe Amount do
    describe "validations" do
    end

    describe Amount do
      subject { FactoryGirl.build(:amount) }
      it { should_not be_valid }  # construct a child class instead
    end
  end
end
