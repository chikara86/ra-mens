class RamenComment < ApplicationRecord
  belongs_to :user
  belongs_to :ramen
end
