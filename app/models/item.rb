class Item < ApplicationRecord
  validates :code, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :url, presence: true, length: { maximum: 255 }
  validates :image_url, presence: true, length: { maximum: 255 }
  
  # お気に入り機能
  has_many :favorites
  has_many :users, through: :favorites
  has_many :fav_users, through: :favorites, source: :user
   
  # アイテム詳細
  has_many :details, dependent: :destroy

end
