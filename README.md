# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Redirect to http://localhost:3000/graphiql

# To fetch all Users
 {
   users{
     id
     name
     email
   }
 }

# To fetch only one User
 {
   user(id:1){
     id
     name
     email
   }
 }

# Create User using Mutation
 mutation {
   createUser(input: {
     name: "Muhammad Bilal"
     email: "spiderman@mail.com"
   }) {
     user {
       id
       name
       email
     }
     errors
   }
 }
