# frozen_string_literal: true

module Types
  class PointType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :description, String
    field :city, String
    field :address, String
    field :country, String
    field :zipcode, String
    field :latitude, String
    field :longitude, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :point_count, Integer

    def point_count
      Point.all.count
    end

  end
end
