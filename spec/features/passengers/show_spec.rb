require 'rails_helper'

RSpec.describe "Passenger show page" do
  it "can visit a passenger show page and see:
    - that passengers name
    - a section of the page that displays all flight numbers of the flights for that passenger
    - all flight numbers listed link to that flights show page" do
    airline_1 = Airline.create(name: "United")
    flight_1 = Flight.create(number: "JX12", date: "02/24/2020", time: "1:30pm", arrival_city: "Chicago", departure_city: "Denver", airline_id: airline_1.id)
    flight_2 = Flight.create(number: "AG45X", date: "02/24/2020", time: "6:00pm", arrival_city: "New York", departure_city: "Chicago", airline_id: airline_1.id)
    flight_3 = Flight.create(number: "GT6S", date: "03/01/2020", time: "2:00pm", arrival_city: "Denver", departure_city: "New York", airline_id: airline_1.id)

    passenger_1 = Passenger.create(name: "Caligula", age: 22)

    FlightPassenger.create(flight: flight_1, passenger: passenger_1)
    FlightPassenger.create(flight: flight_2, passenger: passenger_1)
    FlightPassenger.create(flight: flight_3, passenger: passenger_1)

    visit "/passengers/#{passenger_1.id}"

    expect(page).to have_content("Passenger name: Caligula")
    Flight.all.each do |flight|
    within "#flight-#{flight.id}"
      click_on("#{flight.number}")
      expect(current_path).to eq("/flights/#{flight.id}")
      visit "/passengers/#{passenger_1.id}"
    end
  end

# this test is failing because I am only finding the passenger's existing flight
# not the flight number I am submitting with the form... infuriating
  it "can add a passenger to a flight" do
    airline_1 = Airline.create(name: "United")
    flight_1 = Flight.create(number: "JX12", date: "02/24/2020", time: "1:30pm", arrival_city: "Chicago", departure_city: "Denver", airline_id: airline_1.id)
    flight_2 = Flight.create(number: "AG45", date: "02/24/2020", time: "6:00pm", arrival_city: "New York", departure_city: "Chicago", airline_id: airline_1.id)
    flight_3 = Flight.create(number: "GT6S", date: "03/01/2020", time: "2:00pm", arrival_city: "Denver", departure_city: "New York", airline_id: airline_1.id)

    passenger_1 = Passenger.create(name: "Caligula", age: 22)
    FlightPassenger.create(flight: flight_1, passenger: passenger_1)

    visit "/passengers/#{passenger_1.id}"

    expect(page).to have_field(:flight_number)

    fill_in :flight_number, with: "AG45"
    click_on("Submit")
    expect(current_path).to eq("/passengers/#{passenger_1.id}")

    within "#flight-#{flight_2.id}"
      click_on("#{flight_2.id}")
      expect(current_path).to eq("/flights/#{flight_2.id}")
  end
end
