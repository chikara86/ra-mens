class Genre < ApplicationRecord
  has_many :ramen_ganres
  has_many :ramens, through: :ramen_ganres
end
