module Mutations
    module Points
        class Add < Mutations::BaseMutation
            argument :name, String, required: true
            argument :description, String, required: true
            argument :city, String, required: true
            argument :image, ApolloUploadServer::Upload, required: true

            graphql_name "AddPoint"

            field :point, Types::PointType, null: false
            field :errors, [String], null: false


            #def resolve(name:, description:, city:, image:)
            def resolve(input)
                file = input[:image]
                blob = ActiveStorage::Blob.create_and_upload!(
                    io: file,
                    filename: file.original_filename,
                    content_type: file.content_type
                ) 

                point = Point.new(
                                 name: input[:name],
                                 description: input[:description],
                                 city: input[:city],
                                 image: blob )

                if point.save
                    {point: point, errors: []}
                else
                    {point: nil, errors: point.errors.full_messages}
                end

            end
        end
    end
end

#{"query": "mutation ($name: String!, $image: Upload!) { addPoint( input: { name: $name image: $image }) { point { id name  imageUrl } errors } }", "variables": { "name": "Piazza Mercato",  "image": null } }