require 'rails_helper'

RSpec.describe "Flight show page" do
  it "can show the flights:
      - number
      - date
      - time
      - departure city
      - arrival city
      - the name of the airline this flight belongs
      - the names of all of the passengers on this flight" do

    airline_1 = Airline.create(name: "United")
    flight_1 = Flight.create(number: "JX12", date: "02/24/2020", time: "1:30pm", arrival_city: "Chicago", departure_city: "Denver", airline_id: airline_1.id)
    passenger_1 = Passenger.create(name: "Caligula", age: 22)
    passenger_2 = Passenger.create(name: "Nero", age: 18)
    passenger_3 = Passenger.create(name: "Julius Caeser", age: 22)

    FlightPassenger.create(flight: flight_1, passenger: passenger_1)
    FlightPassenger.create(flight: flight_1, passenger: passenger_2)
    FlightPassenger.create(flight: flight_1, passenger: passenger_3)

    visit "/flights/#{flight_1.id}"

    expect(page).to have_content("Flight number: #{flight_1.number}")
    expect(page).to have_content("Departure date: #{flight_1.date}")
    expect(page).to have_content("Departure time: #{flight_1.time}")
    expect(page).to have_content("Departure city: #{flight_1.departure_city}")
    expect(page).to have_content("Arrival city: #{flight_1.arrival_city}")
  end
end
