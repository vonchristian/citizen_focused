require 'rails_helper'

module Subscribers
  describe City do
    it_behaves_like 'a Subscriber subtype', kind: :city
  end
end
