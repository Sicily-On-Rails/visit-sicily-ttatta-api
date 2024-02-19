module Types
    class CategoryType < Types::BaseObject
        field :name, String, null: false
        field :points, [PointType], null: false
    end
end