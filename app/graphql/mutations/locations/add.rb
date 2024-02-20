module Mutations
    module Locations
        class Add < Mutations::BaseMutation
            argument :name, String, required: true
            argument :city, String, required: true 

            field :location, Types::LocationType, null: false
            field :errors, [String], null: false

            def resolve(name:, city:)
                location = Location.new(name: name, city: city)
                if location.save
                    {location: location, errors: []}
                else
                    {location: nil, errors: location.errors.full_messages}
                end
            end
        end
    end
end