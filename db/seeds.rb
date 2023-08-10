# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# user1 = User.create!(
#   name: "Admin User",
#   username: "admin",
#   role: "admin",
#   email: "admin@gmail.com",
#   password: "123456",
#   password_confirmation: "123456"
# )

# user2 = User.create!(
#   name: "Regular User",
#   username: "user",
#   role: "customer",
#   email: "user@gmail.com",
#   password: "123456",
#   password_confirmation: "123456"
# )

# Recipes
# recipe1 = Recipe.create!(
#   title: "Paneer Tikka Masala",
#   ingredients: "200g paneer, yogurt, spices...",
#   instructions: "1. Marinate paneer in yogurt and spices. 2. Grill or cook in a pan...",
#   tags: "paneer, tikka, indian",
#   user_id: 
# )

# recipe2 = Recipe.create!(
#   title: "Chana Masala",
#   ingredients: "1 cup chickpeas, tomatoes, onions, spices...",
#   instructions: "1. Cook chickpeas. 2. Prepare a tomato-onion gravy with spices...",
#   tags: "chana masala, chickpeas, indian",
#   user_id: 
# )


# Assuming you have 6 users with IDs 1 to 6

# User 1
# Recipe.create!(
#   title: "User 1 Recipe 1",
#   ingredients: "Ingredients for User 1 Recipe 1...",
#   instructions: "Instructions for User 1 Recipe 1...",
#   tags: "user 1, recipe 1",
#   user_id: 1
# )

# Recipe.create!(
#   title: "User 1 Recipe 2",
#   ingredients: "Ingredients for User 1 Recipe 2...",
#   instructions: "Instructions for User 1 Recipe 2...",
#   tags: "user 1, recipe 2",
#   user_id: 1
# )

# # User 2
# Recipe.create!(
#   title: "User 2 Recipe 1",
#   ingredients: "Ingredients for User 2 Recipe 1...",
#   instructions: "Instructions for User 2 Recipe 1...",
#   tags: "user 2, recipe 1",
#   user_id: 2
# )

# Recipe.create!(
#   title: "User 2 Recipe 2",
#   ingredients: "Ingredients for User 2 Recipe 2...",
#   instructions: "Instructions for User 2 Recipe 2...",
#   tags: "user 2, recipe 2",
#   user_id: 2
# )

# ... Repeat the same pattern for Users 3 to 6

# Favorite.create!(
#   user_id: 6,
#   recipe_id: 1
# )

# Favorite.create!(
#   user_id: 6,
#   recipe_id: 2
# )

# puts "Seed data created successfully!"
