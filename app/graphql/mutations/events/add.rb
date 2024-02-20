module Mutations
    module Events
        class Add < Mutations::BaseMutation
            argument :name, String, required: true
            argument :description, String, required: true
            argument :start_date, GraphQL::Types::ISO8601DateTime
            argument :end_date, GraphQL::Types::ISO8601DateTime
            graphql_name "AddEvent"
            field :event, Types::EventType, null: false
            field :errors, [String], null: false

            def resolve(name:, description:, start_date:, end_date:)
                event = Event.new(name: name, description: description, start_date: start_date, end_date: end_date)

                if event.save
                    {event: event, errors: []}
                else
                    {event: nil, errors: event.errors.full_messages}
                end
            end
        end
    end
end