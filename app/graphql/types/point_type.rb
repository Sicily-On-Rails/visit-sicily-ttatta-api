# frozen_string_literal: true
include(Rails.application.routes.url_helpers)

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
    field :image_url, String, null: true


    field :point_count, Integer

    field :categories, [CategoryType]

    #field :reviews, [ReviewType]
    field :reviews, ReviewType.connection_type, null: false, default_page_size: 2


    def point_count
      Point.all.count
    end

    def image_url
      if object.image.present?
        rails_blob_path(object.image, only_path: true)
      end
    end

  end
end
