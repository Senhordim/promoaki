# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Segment.create(name: "Calçados")
Segment.create(name: "Alimentação")
Segment.create(name: "Papelaria")
Segment.create(name: "Roupas")
Segment.create(name: "Doméstico")
Segment.create(name: "venda")

Admin.create(
  full_name: "Admin Sistema",
  role: 0,
  email: "admin@admin.com.br",
  password: 'promoaki217**',
  password_confirmation: 'promoaki217**'
)
