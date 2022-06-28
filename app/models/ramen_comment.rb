class RamenComment < ApplicationRecord
  belongs_to :user
  belongs_to :ramen
  validates :comment, presence: true
end
