# frozen_string_literal: true

module Types
  class LocationType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :description, String
    field :city, String
    field :address, String
    field :country, String
    field :zipcode, String
    field :latitude, Float
    field :longitude, String
    field :event_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
