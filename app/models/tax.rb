class Tax < ApplicationRecord
  belongs_to :taxable, polymorphic: true

end
