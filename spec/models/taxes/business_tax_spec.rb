require 'rails_helper'

module Taxes
  describe BusinessTax do
    it_behaves_like 'a Tax subtype', kind: :business_tax
  end
end
