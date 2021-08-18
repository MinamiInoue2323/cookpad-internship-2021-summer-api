module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :viewer, Types::UserType, null: true
    field :pickup_locations, [Types::PickupLocationType], null: false
    field :products, [Types::ProductType], null: false

    def viewer 
      context[:current_user]
    end
    def pickup_locations 
      PickupLocation.all
    end

    def products
      Product.all
    end


  end
end
