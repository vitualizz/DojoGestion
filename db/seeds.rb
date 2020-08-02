# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  School.create(
    name: 'Columna Pasco',
    subdomain: 'columna',
    email: 'columna@school.edu.pe',
    locale: 'es'
  )

  Student.create(
    email: 'vitualizz@gmail.com',
    fname: 'Lee',
    lname: 'Palacios',
    username: 'vitualizz',
    document: '22886644',
    genre: 'M'
  )

  Teacher.create(
    email: 'nicpa@gmail.com',
    fname: 'Nícolas',
    lname: 'Tosirrico',
    username: 'tosino',
    document: '22886655',
    genre: 'M'
  )

  Parent.create(
    email: 'ferdinando@gmail.com',
    fname: 'Fernando',
    lname: 'Palacios',
    username: 'samurai',
    document: '22886677',
    genre: 'M'
  )
end
