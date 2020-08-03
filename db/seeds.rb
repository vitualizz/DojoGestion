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
  Apartment::Tenant.switch!('columna')

  Student.create(
    email: 'vitualizz@gmail.com',
    fname: 'Lee',
    lname: 'Palacios',
    document: '22886644',
    username: 'vitualizz',
    password: 'p3p3gr1ll0',
    password_confirmation: 'p3p3gr1ll0',
    genre: 'M'
  )

  Teacher.create(
    email: 'nicpa@gmail.com',
    fname: 'Nícolas',
    lname: 'Tosirrico',
    document: '22886655',
    username: 'tosino',
    password: 'p3p3gr1ll0',
    password_confirmation: 'p3p3gr1ll0',
    genre: 'M'
  )

  Parent.create(
    email: 'ferdinando@gmail.com',
    fname: 'Fernando',
    lname: 'Palacios',
    document: '22886677',
    username: 'samurai',
    password: 'p3p3gr1ll0',
    password_confirmation: 'p3p3gr1ll0',
    genre: 'M'
  )
end
