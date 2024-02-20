module Mutations
    module Events
        class Delete < Mutations::BaseMutation
            type Types::EventType
            argument :id, ID, required: true
            graphql_name "DeleteEvent"

            def resolve(id:)
                Event.find(id).destroy
            end
        end
    end
end