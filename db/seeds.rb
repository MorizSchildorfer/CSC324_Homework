# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

GenerationDatum.create( seed: 42, width: 200, height: 200, river_length: 5)
GenerationDatum.create( seed: 1, width: 100, height: 50, river_length: 0)
GenerationDatum.create( seed: 420, width: 10, height: 5, river_length: 1)
GenerationDatum.create( seed: 69, width: 205, height: 215, river_length: 12)
GenerationDatum.create( seed: 666, width: 100, height: 150, river_length: 27)
GenerationDatum.create( seed: 777, width: 350, height: 100, river_length: 200)
