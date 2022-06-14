class Ramen < ApplicationRecord
  has_one_attached :image
  validates :user_id, :genre_id, :area_id, :shop_name, :name, :price, :introduction, :image, presence: true
  has_many :ramen_genres
  has_many :genres, through: :ramen_genres

  belongs_to :area
  belongs_to :user, dependent: :destroy
  belongs_to :genre, dependent: :destroy

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

end
