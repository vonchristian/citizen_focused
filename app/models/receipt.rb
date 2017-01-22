class Receipt < ApplicationRecord
  belongs_to :receiptable, polymorphic: true
end
