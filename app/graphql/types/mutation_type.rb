# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject

    field :add_point, mutation: Mutations::Points::Add
    field :update_point, mutation: Mutations::Points::Update
    field :delete_point, mutation: Mutations::Points::Delete

    field :add_event, mutation: Mutations::Events::Add
    field :update_event, mutation: Mutations::Events::Update
    field :delete_event, mutation: Mutations::Events::Delete

    field :add_location, mutation: Mutations::Locations::Add
    field :update_location, mutation: Mutations::Locations::Update
    field :delete_location, mutation: Mutations::Locations::Delete


    field :add_review, mutation: Mutations::Reviews::Add


    field :create_store, mutation: Mutations::CreateStore

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
