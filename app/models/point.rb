class Point < ApplicationRecord
    has_many :categorized_points, dependent: :destroy
    has_many :categories, through: :categorized_points
    has_many :reviews
    has_one_attached :image
    validate :acceptable_image

    def acceptable_image
        return unless image.attached?
        
        unless image.blob.byte_size <= 1.megabyte
            errors.add(:image, "is too big")
        end

        acceptable_types = ["image/jpeg", "image/png", "image/webp"]

        unless acceptable_types.include?(image.content_type)
            errors.add(:image, "must be a JPEG, PNG or WEBP")
        end
    end

end
