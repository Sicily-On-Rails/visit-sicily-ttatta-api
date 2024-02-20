module Mutations
    module Locations
        class Delete < Mutations::BaseMutation
            type Types::LocationType
            argument :id, ID, required: true
            graphql_name "DeleteLocation"

            def resolve(id:)
                Location.find(id).destroy
            end
        end
    end
end