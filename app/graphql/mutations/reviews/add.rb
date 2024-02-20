module Mutations
    module Reviews 
        class Add < Mutations::BaseMutation
            type Types::ReviewType, null: false

            argument :point_id, ID, required: true
            argument :rating, Integer, required: true
            argument :comment, String, required: true

            graphql_name "AddReview"

            def resolve(point_id:, rating:, comment:)
                Review.create(point_id: point_id, rating: rating, comment: comment)
            end


        end
    end
end