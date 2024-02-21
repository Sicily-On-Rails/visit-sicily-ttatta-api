module Mutations
    module Events
        class Add < Mutations::BaseMutation
            argument :name, String, required: true
            argument :description, String, required: true
            argument :start_date, GraphQL::Types::ISO8601DateTime
            argument :end_date, GraphQL::Types::ISO8601DateTime
            argument :image, ApolloUploadServer::Upload, required: true

            graphql_name "AddEvent"
            
            field :event, Types::EventType, null: false
            field :errors, [String], null: false

            
            
            #def resolve(name:, description:, start_date:, end_date:)

            #    event = Event.new(name: name, description: description, start_date: start_date, end_date: end_date)

            #    if event.save
            #        {event: event, errors: []}
            #    else
            #        {event: nil, errors: event.errors.full_messages}
            #    end
            #end


            def resolve(input)

                file = input[:image]
                blob = ActiveStorage::Blob.create_and_upload!(
                    io: file,
                    filename: file.original_filename,
                    content_type: file.content_type
                ) 

                event = Event.new(
                                name: input[:name], 
                                description: input[:description],
                                start_date: input[:start_date],
                                end_date: input[:end_date],
                                image: blob)



                if event.save
                    {event: event, errors: []}
                else
                    {event: nil, errors: event.errors.full_messages}
                end
            end


        end
    end
end

#{"query": "mutation ($name: String!, $image: Upload!) { addEvent( input: { name: $name image: $image }) { event { id name  imageUrl } errors } }", "variables": { "name": "Concerto in piazza",  "image": null } }