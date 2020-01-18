class Detail < ApplicationRecord
  validates :purchase_date, length: { maximum: 20, message: "20文字以字" }
  validates :place, length: { maximum: 30 }
  validates :person, length: { maximum: 30 }
  validates :reason, length: { maximum: 50 }
  
  belongs_to :item 
end
