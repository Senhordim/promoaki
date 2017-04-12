# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Segment.create(name: "venda")

store2 = Store.create(social_name: "Empresa teste",  fantasy_name: "Empresa 3",  cnpj: "41542344000100", phone: "33380098", email: "empresa@gmail.com", password: "qweqwe123")
store1 = Store.create(social_name: "Empresa teste",  fantasy_name: "Empresa 2",  cnpj: "77643917000139", phone: "33380098", email: "empresa@gmail.com", password: "qweqwe123")

Address.create(store_id: store2.id, street: 'Augusto Bertoldi',    numb: '13', city: 'Curitiba', state: 'PR', country: 'Brasil')
Address.create(store_id: store1.id, street: 'Pia Lazari Bertoldi', numb: '3',  city: 'Curitiba', state: 'PR', country: 'Brasil')

Promotion.create(title: "Promoção teste" ,  description: "Uma simples promoção de desconto" ,quantity: 10 ,endDate: Date.tomorrow ,segment: Segment.first, store: store1)
Promotion.create(title: "Promoção teste22" ,description: "Uma simples promoção de desconto" ,quantity: 10 ,endDate: Date.tomorrow ,segment: Segment.first, store: store2)