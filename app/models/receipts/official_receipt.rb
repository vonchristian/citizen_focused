module Receipts
  class OfficialReceipt < Receipt
    def self.generate(receiptable)
      if all.empty?
        self.create(receiptable: receiptable, number: "#{'1'.rjust(12, "0")}")
      else
        self.create(receiptable: receiptable, number: "#{last.number.succ.rjust(12, "0")}")
      end
    end
  end
end
