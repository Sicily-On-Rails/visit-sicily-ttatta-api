class Event < ApplicationRecord
    has_many :event_locations
    has_many :locations, through: :event_locations
    has_one_attached :image
end
