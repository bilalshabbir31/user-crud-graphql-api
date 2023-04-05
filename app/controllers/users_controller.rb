class UsersController < ApplicationController
    def index
        query = <<~GRAPHQL
        {
            users {
            id
            name
            email
            }
        }
        GRAPHQL

        result = GraphQlSchema.execute(query)
        data = result["data"]

        render json: data
    end

    def new
    end

    def create
      query = <<~GRAPHQL
        mutation CreateUser($name: String!, $email: String!) {
          createUser(input: { name: $name, email: $email }) {
            user {
              id
              name
              email
            }
          }
        }
      GRAPHQL

      variables = {
        name: params[:user][:name],
        email: params[:user][:email]
      }

      result = GraphQlSchema.execute(query, variables: variables)
      data = result["data"]["createUser"]["user"]
    end

    def show
        query = <<~GRAPHQL
        query GetUser($id: ID!) {
          user(id: $id) {
            id
            name
            email
          }
        }
      GRAPHQL
  
      result = GraphQlSchema.execute(
        query,
        variables: { id: params[:id] }
      )
  
      data = result["data"]
      render json: data
    end
end
