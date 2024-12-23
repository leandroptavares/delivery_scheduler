delivery = Delivery.new(
  pickup_address: "Willem de Zwijgerlaan 336A, Amsterdam",
  delivery_address: "De Clercqstraat 79",
  weight: rand(1..100),
  distance: 2.1,
  scheduled_time: Time.now + rand(1..30).days,
)

delivery.save!

delivery = Delivery.new(
  pickup_address: "Spaklerweg 44a, Amsterdam",
  delivery_address: "Jan van Galenstraat 92H, Amsterdam",
  weight: rand(1..100),
  distance: 15.1,
  scheduled_time: Time.now + rand(1..30).days,
)

delivery.save!

delivery = Delivery.new(
  pickup_address: "Aletta Jacobslaan 5, Amsterdam",
  delivery_address: "Jan van Galenstraat 315, Amsterdam",
  weight: rand(1..100),
  distance: 4.7,
  scheduled_time: Time.now + rand(1..30).days,
)

delivery.save!

puts "Deliveries created!"
