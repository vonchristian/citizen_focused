require 'rails_helper'

module Fees
  describe MayorsPermitFee do
    it_behaves_like 'a Fee subtype', kind: :mayors_permit_fee
  end
end
