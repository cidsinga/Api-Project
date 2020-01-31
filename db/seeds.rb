# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class seed
  def self.begin
    seed = Seed.new
    seed.generate_cats
  end

  def generate_cats
    rand(15..35).times do
      cats = []
      cats.push(Cats.create!(
        name: Faker::Movies::StarWars.character
        color: Faker::Color.color_name
        kid_friendly: Faker::Boolean.boolean(true_ratio: 0.5)
        age: Faker::Number.between(from1. to: 15)
        ))
      end
    end
  end
  puts "Created #{Cats.count} Cats."
end
end

def generate_dogs
  rand(15..35).times do
    dogs = []
    dogs.push(Dogs.create!(
      name: Faker::Movies::StarWars.character
      color: Faker::Color.color_name
      kid_friendly: Faker::Boolean.boolean(true_ratio: 0.5)
      age: Faker::Number.between(from1. to: 15)
      ))
    end
  end
end
puts "Created #{Dogs.count} dogs."
end
end
end
