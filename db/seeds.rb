# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!({name: 'test user', email: 'testuser@gmail.com', amount: 30000, password: 'testuser', password_confirmation: 'testuser'})

Category.create!([{ name: 'Internet', user_id: 1, created_at: 1.day.ago }, { name: 'Airtime', user_id: 1, created_at: 1.day.ago }, { name: 'Grocery', user_id: 1, created_at: 2.day.ago }, { name: 'Utility', user_id: 1, created_at: 2.day.ago }])
@category1 = Category.find_by!(id: 1)
@category1.products.create!({ name: 'milk', author_id: 1, amount: 10, created_at: 1.day.ago, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac augue pulvinar sem vestibulum sollicitudin. Pellentesque efficitur sem' })
@category1.products.create!({ name: 'sugar', author_id: 1, amount: 30, created_at: 1.day.ago, description: 'ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac augue pulvinar sem vestibulum sollicitudin. Pellentesque efficitur sem' })
@category1.products.create!({ name: 'indomie', author_id: 1, amount: 50, created_at: 2.day.ago, description: 'sit amet, consectetur adipiscing elit. Mauris ac augue pulvinar sem vestibulum sollicitudin. Pellentesque efficitur sem' })
@category1.products.create!({ name: 'toilet paper', author_id: 1, amount: 90, created_at: 2.day.ago, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac augue pulvinar sem vestibulum sollicitudin. Pellentesque efficitur sem' })

@category2 = Category.find_by!(id: 9)
@category2.products.create!({ name: 'water', author_id: 1, amount: 100, created_at: 1.day.ago, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac augue pulvinar sem vestibulum sollicitudin. Pellentesque efficitur sem' })
@category2.products.create!({ name: 'light', author_id: 1, amount: 30, created_at: 2.day.ago, description: 'ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac augue pulvinar sem vestibulum sollicitudin. Pellentesque efficitur sem' })
@category2.products.create!({ name: 'tax', author_id: 1, amount: 20, created_at: 3.day.ago, description: 'sit amet, consectetur adipiscing elit. Mauris ac augue pulvinar sem vestibulum sollicitudin. Pellentesque efficitur sem' })
