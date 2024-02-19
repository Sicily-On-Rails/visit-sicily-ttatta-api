module Mutations
    class Mutations::CreateStore < Mutations::BaseMutation
        argument :name, String, required: true
        argument :city, String, required: true 

        field :store, Types::StoreType, null: false
        field :errors, [String], null: false

        def resolve(name:, city:)
            store = Store.new(name: name, city: city)
            if store.save
                {store: store, errors: []}
            else
                {store: nil, errors: store.errors.full_messages}
            end
        end
        

    end
end