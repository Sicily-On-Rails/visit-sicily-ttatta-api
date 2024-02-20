module Mutations
    module Points
        class Delete < Mutations::BaseMutation
            type Types::PointType
            argument :id, ID, required: true

            def resolve(id:)
                Point.find(id).destroy
            end

        end
    end
end