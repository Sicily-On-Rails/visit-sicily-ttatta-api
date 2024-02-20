module Mutations
    module Events
        class Update < Mutations::BaseMutation
            type Types::EventType
            argument :id, ID, required: true
            argument :name, String, required: true
            #argument :description, String, required: true
            #argument :start_date, GraphQL::Types::ISO8601DateTime
            #argument :end_date, GraphQL::Types::ISO8601DateTime
            graphql_name "UpdateEvent"

            def resolve(id:, name:)
                Event.find(id).tap do |event|
                    event.name = name
                    event.save
                end
            end

        end
    end
end
