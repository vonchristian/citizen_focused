module Receipts
  class OfficialReceiptPdf < Prawn::Document
    TABLE_WIDTH = [25, 60, 50]
    def initialize(receiptable, view_context)
      @receiptable = receiptable
      @view_context = view_context
      line_height = 400
      min_height = 420
      variable_height = line_height * line_height
      height = min_height + variable_height
      super(margin: 10, page_size: [160, line_height], page_layout: :portrait)
      heading
      receiptable_details
      payment_details
      repeat :all do
      #Create a bounding box and move it up 18 units from the bottom boundry of the page
      bounding_box [bounds.left, bounds.bottom + 25], width: bounds.width do
        barcode = Barby::Code39.new(@receiptable.number)
        barcode.annotate_pdf(self, height: 20)
        move_down 2
        text "#{@receiptable.number}", size: 6, align: :center
        text "MACHINE ACCREDITATION : ", size: 4, align: :center
        move_down 2
        text "<b>THIS SERVES AS AN OFFICIAL RECEIPT</b>", size: 6, align: :center, inline_format: true
      end
    end

    def heading
      text "Heading"
    end
    def receiptable_details
      text "details"
    end
    def payment_details
      text "apymentst"
    end
  end
end
