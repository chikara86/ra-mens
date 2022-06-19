class Ramen < ApplicationRecord

  geocoded_by :location
  after_validation :geocode

  has_one_attached :image
  validates :user_id, :genre_id, :area_id, :shop_name, :name, :price, :introduction, :image, presence: true
  has_many :ramen_genres
  has_many :genres, through: :ramen_genres
  has_many :ramen_comments, dependent: :destroy
  has_many :ramen_favorites, dependent: :destroy


  belongs_to :area
  belongs_to :user
  belongs_to :genre

  def ramen_favorited_by?(user)
    if user.nil?
      return false
    end
    ramen_favorites.exists?(user_id: user.id)
  end

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

end
