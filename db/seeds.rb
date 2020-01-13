# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


airline_1 = Airline.create(name: "United")
flight_1 = Flight.create(number: "JX12", date: "02/24/2020", time: "1:30pm", arrival_city: "Chicago", departure_city: "Denver", airline_id: airline_1.id)
flight_2 = Flight.create(number: "AG45", date: "02/24/2020", time: "6:00pm", arrival_city: "New York", departure_city: "Chicago", airline_id: airline_1.id)
flight_3 = Flight.create(number: "GT6S", date: "03/01/2020", time: "2:00pm", arrival_city: "Denver", departure_city: "New York", airline_id: airline_1.id)

passenger_1 = Passenger.create(name: "Caligula", age: 22)
FlightPassenger.create(flight: flight_1, passenger: passenger_1)
