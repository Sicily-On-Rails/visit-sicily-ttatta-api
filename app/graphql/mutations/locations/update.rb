module Mutations
    module Locations
        class Update < Mutations::BaseMutation
            type Types::LocationType

            argument :id, ID, required: true
            argument :name, String
            graphql_name "UpdateLocation"

            def resolve(id:, name:)
                Location.find(id).tap do |location|
                    location.name = name
                    location.save
                end
            end

        end
    end
end