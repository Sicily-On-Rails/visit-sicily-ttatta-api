module Mutations
    module Points
        class Update < Mutations::BaseMutation
            type Types::PointType
            argument :id, ID, required: true
            #argument :name, String
            #argument :description, String
            argument :city, String
=begin
            def resolve(id:, name:, description:, city: )
                Point.find(id).update(name: name, description: description, city: city)
            end
=end
            def resolve(id:, city:)
                Point.find(id).tap do |point|
                    point.update(city: city)
                end
            end

        end
    end
end