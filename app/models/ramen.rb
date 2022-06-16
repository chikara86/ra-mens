class Ramen < ApplicationRecord
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
