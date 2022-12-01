# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Restaurant.destroy_all
# Pizza.destroy_all
# RestaurantPizza.destroy_all

puts "🏕 Seeding Restaurants..."

7.times do

    Restaurant.create(
        name: Faker::Restaurant.name,
        address: Faker::Address.street_address
    )

end

puts "🏕 Seeding Pizzas..."

Pizza.create(
    [
        {name: "New York-Style Pizza", ingredients:"pepperoni,garlic, mushroom, anchovies, parmesan-cheese, oregano, red-pepper"},
        {name: "California Pizza", ingredients:"artichoke, goat cheese, mustard,ricotta cheese, pate, red peppers"},
        {name: "Chicago Pizza", ingredients:"sausage, pepperoni, onion, mushrooms,green peppers"},
        {name: "Greek Pizza", ingredients:"tomato sauce, cheddar cheese, feta cheese, black olives, red onion"},
        {name: "Detroit Pizza", ingredients:"pepperoni, brick cheese, mushrooms, olive"},
        {name: "St. Louis Pizza", ingredients:"cheddar cheese,swiss cheese, tomato sauce, oregano"},
        {name: "Neopolitan Pizza", ingredients:"tomato sauce, mozzarella cheese, basil"},
        {name: "Sicilian Pizza", ingredients:" tomato, onion, anchovies, herbs"}
    ]
)

puts "🏕 Seeding Restaurant_Pizzas..."

17.times do

    RestaurantPizza.create(
        # price: rand(1.00..30.00).round(2), ---> t.float
        price: rand(1..30),
        pizza_id: Pizza.all[rand(0..Pizza.all.length-1)].id,
        restaurant_id: Restaurant.all[rand(0..Restaurant.all.length-1)].id
    )


end

puts "✅ Done seeding!"
