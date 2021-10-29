class Review < ApplicationRecord
  belongs_to :list

  validates :comment, presence: true
  validates :rating, numericality: { only_integer: true, in: 0..10 }
end
