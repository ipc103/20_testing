# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create([
  {name: 'Horror'},
  {name: 'Romance'},
  {name: 'Comedy'},
  {name: 'Drama'},
  {name: 'Action'},
  {name: 'Adventure'},
  {name: 'Thriller'}
  ])

50.times do
  Movie.create(
    {title: Faker::Book.title,
    release_year: (1940..2016).to_a.sample,
    category_ids: Category.ids.sample(2)}
  )
end

400.times do
  Review.create({
    movie_id: Movie.ids.sample,
    rating: (1..5).to_a.sample,
    content: Faker::Lorem.paragraphs(2)
    })
end
