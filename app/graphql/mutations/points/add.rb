module Mutations
    module Points
        class Add < Mutations::BaseMutation
            argument :name, String, required: true
            argument :description, String, required: true
            argument :city, String, required: true
            graphql_name "AddPoint"
            field :point, Types::PointType, null: false
            field :errors, [String], null: false


            def resolve(name:, description:, city:)
                point = Point.new(name: name, description: description, city: city )

                if point.save
                    {point: point, errors: []}
                else
                    {point: nil, errors: point.errors.full_messages}
                end

            end
        end
    end
end