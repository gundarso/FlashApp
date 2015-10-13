# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name_en: 'Clothing & shoes')
Category.create(name_en: 'Electronics & toys')
Category.create(name_en: 'Events & entertainment')
Category.create(name_en: 'Flowers & gifts')
Category.create(name_en: 'Food & drinks')
Category.create(name_en: 'Health & beauty')
Category.create(name_en: 'House & home')
Category.create(name_en: 'Jewellery & accessories')
Category.create(name_en: 'Other categories')

Shop.create(
  name: 'Zara',
  street_address: 'Toison d\'Or 25',
  city: 'Ixelles',
  postcode: '1050',
  country: 'Belgium',
  latitude: 50.8365051,
  longitude: 4.3552722,
  phone: '02923498',
  contact_email: 'info@zarabxl.es',
  email:'info@zarabxl.es',
  password: 'info@zarabxl.es'
  )

Shop.create(
  name: 'Mediamarkt',
  street_address: 'Bahnhofstrasse 7',
  city: 'Aachen',
  postcode: '52064',
  country: 'Germany',
  latitude: 50.7700137,
  longitude: 6.0895888,
  phone: '0392923498',
  contact_email: 'aachenzentrum@mediamarkt.de',
  email:'aachenzentrum@mediamarkt.de',
  password: 'aachenzentrum@mediamarkt.de'
  )

Shop.create(
  name: 'H&M',
  street_address: 'Rue Neuve 27',
  city: 'Brussels',
  postcode: '1000',
  country: 'Belgium',
  latitude: 50.8514998,
  longitude: 4.3526746,
  phone: '0223498',
  contact_email: 'info@hetm.be',
  email:'info@hetm.be',
  password: 'info@hetm.be'
  )

Shop.create(
  name: 'GAP',
  street_address: 'Chaussee d\'Ixelles 387',
  city: 'Ixelles',
  postcode: '1050',
  country: 'Belgium',
  latitude: 50.8278498,
  longitude: 4.3692292,
  phone: '0209874',
  contact_email: 'ixelles@gap.be',
  email:'ixelles@gap.be',
  password: 'ixelles@gap.be'
  )

Shop.create(
  name: 'FNAC',
  street_address: 'Toison d\'Or 36',
  city: 'Ixelles',
  postcode: '1050',
  country: 'Belgium',
  latitude: 50.8362745,
  longitude: 4.3552685,
  phone: '02245798',
  contact_email: 'ixelles@fnac.be',
  email:'ixelles@fnac.be',
  password: 'ixelles@fnac.be'
  )

Shop.create(
  name: 'Saturn',
  street_address: 'Postbaan 1',
  city: 'Maastricht',
  postcode: '6218',
  country: 'Netherlands',
  latitude: 50.8647504,
  longitude: 5.6687031,
  phone: '02343498',
  contact_email: 'saturn@maastricht.saturn.de',
  email:'saturn@maastricht.saturn.de',
  password: 'saturn@maastricht.saturn.de'
  )

Shop.create(
  name: 'Paul',
  street_address: 'Rue des Frères Wright 5',
  city: 'Charleroi',
  postcode: '6041',
  country: 'Belgium',
  latitude: 50.4698443,
  longitude: 4.4669757,
  phone: '01223498',
  contact_email: 'charleroi@paul.be',
  email:'charleroi@paul.be',
  password: 'charleroi@paul.be'
  )

Shop.create(
  name: 'Jacques et fils',
  street_address: 'Avenue Louise 245',
  city: 'Brussels',
  postcode: '1000',
  country: 'Belgium',
  latitude: 50.8252079,
  longitude: 4.3632707,
  phone: '02923498',
  contact_email: 'fils@jacques.be',
  email:'fils@jacques.be',
  password: 'fils@jacques.be'
  )

Shop.create(
  name: 'Bouquet M',
  street_address: 'place Charles Graux 5',
  city: 'Ixelles',
  postcode: '1050',
  country: 'Belgium',
  latitude: 50.8181182,
  longitude: 4.3607844,
  phone: '02923498',
  contact_email: 'fleurs@bouquet.be',
  email:'fleurs@bouquet.be',
  password: 'fleurs@bouquet.be'
  )

Shop.create(
  name: 'BD St.Gilles',
  street_address: 'Chaussee de Waterloo 258',
  city: 'Saint-Gilles',
  postcode: '1060',
  country: 'Belgium',
  latitude: 50.8259148,
  longitude: 4.3449255,
  phone: '0234598',
  contact_email: 'bd@franc.be',
  email:'bd@franc.be',
  password: 'bd@franc.be'
  )

Shop.create(
  name: 'Inno Neuve',
  street_address: 'Rue Neuve 125',
  city: 'Brussels',
  postcode: '1000',
  country: 'Belgium',
  latitude: 50.8540522,
  longitude: 4.3551351,
  phone: '02987398',
  contact_email: 'neuve@inno.be',
  email:'neuve@inno.be',
  password: 'neuve@inno.be'
  )

Shop.create(
  name: 'City2',
  street_address: 'Chemin Royal 35',
  city: 'Nivelles',
  postcode: '1400',
  country: 'Belgium',
  latitude: 50.5642816,
  longitude: 4.3602037,
  phone: '02343498',
  contact_email: 'nivelles@city2.be',
  email:'nivelles@city2.be',
  password: 'nivelles@city2.be'
  )

20.times do
Sale.create(
  category_id: rand(1..9),
  shop_id: rand(1..12),
  product_name: ['shoes', 'scarf', 'sandwich', 'YAMAHA amplifier', 'earrings', 'red roses', 'iPod'].sample,
  product_quantity: rand(1..100),
  price: ['35', '50', '256', '234', '53', '24', '276'].sample,
  terms: ['10% off', '30% off', '40% off', '20% off', '2 + 1', '70% off'].sample,
  starting: Time.now,
  ending: Time.now + rand(3600..18000)
  )
end



