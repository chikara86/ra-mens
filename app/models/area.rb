class Area < ApplicationRecord
  has_many :ramens, dependent: :destroy
end
