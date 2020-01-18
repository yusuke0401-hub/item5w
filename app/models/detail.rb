class Detail < ApplicationRecord
  validates :purchase_date, presence: true, length: { maximum: 255, message: "10文字以字" }
  validates :place,  presence: true, length: { maximum: 255 }
  validates :person,  presence: true, length: { maximum: 255 }
  validates :reason, presence: true, length: { maximum: 255 }
  
  
  belongs_to :item 
end
