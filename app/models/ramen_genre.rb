class RamenGenre < ApplicationRecord
  belongs_to :ramen
  belongs_to :genre
end
