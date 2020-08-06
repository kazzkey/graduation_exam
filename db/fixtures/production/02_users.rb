User.seed(
  :id,
  { id: 1, student_id: 1, name: 'Admin', email: Faker::Internet.email, password: 'password', admin: true },
  { id: 2, student_id: 200501, name: Faker::Movies::StarWars.character, email: Faker::Internet.email, password: 'password' },
  { id: 3, student_id: 200502, name: Faker::Movies::StarWars.character, email: Faker::Internet.email, password: 'password' },
  { id: 4, student_id: 200503, name: Faker::Movies::StarWars.character, email: Faker::Internet.email, password: 'password' },
  { id: 5, student_id: 200504, name: Faker::Movies::StarWars.character, email: Faker::Internet.email, password: 'password' },
  { id: 6, student_id: 200505, name: Faker::Movies::StarWars.character, email: Faker::Internet.email, password: 'password' },
)
