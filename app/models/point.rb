class Point < ApplicationRecord
    has_many :categorized_points, dependent: :destroy
    has_many :categories, through: :categorized_points
    has_many :reviews
end
