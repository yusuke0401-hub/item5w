class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 10 , message: "10文字以内"}
  validates :email, presence: true, length: { maximum: 50 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  has_secure_password
  
  mount_uploader :image, ImageUploader
  
  has_many :favorites
  has_many :items,through: :favorites
  has_many :fav_items, through: :favorites, source: :item
  
  def like(item)
    self.favorites.find_or_create_by(item_id: item.id)
  end
  
  def unlike(item)
    favorite = self.favorites.find_by(item_id: item.id)
    favorite.destroy if favorite
  end
  
  def like?(item)
    self.fav_items.include?(item)
  end
end
