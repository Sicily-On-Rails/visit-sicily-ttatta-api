# frozen_string_literal: true

module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :description, String
    field :start_date, GraphQL::Types::ISO8601DateTime
    field :end_date, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :image_url, String, null: true


    def image_url
      if object.image.present?
        rails_blob_path(object.image, only_path: true)
      end
    end

  end
end
