require 'rails_helper'

module Subscribers
  describe Municipality do
    it_behaves_like 'a Subscriber subtype', kind: :municipality
  end
end
