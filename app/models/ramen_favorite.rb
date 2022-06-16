class RamenFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :ramen
end
