module Types
  class MutationType < Types::BaseObject

    # create user mutation field
    field :create_user, mutation: Mutations::CreateUser
  end
end
