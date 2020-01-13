require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'validations' do
    it {should validate_presence_of :number}
    it {should validate_uniqueness_of :number}
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
    it {should validate_presence_of :departure_city}
    it {should validate_presence_of :arrival_city}
  end
  describe 'relationships' do
    it {should belong_to :airline}

    it {should have_many :flight_passengers}
    it {should have_many(:passengers).through(:flight_passengers)}
  end

  describe "instance methods" do
    it "can calculate number of minors" do
      airline_1 = Airline.create(name: "United")
      flight_1 = Flight.create(number: "B5EX", date: "02/24/2020", time: "1:30pm", arrival_city: "Chicago", departure_city: "Denver", airline_id: airline_1.id)

      passenger_1 = Passenger.create(name: "Caligula", age: 22)
      passenger_2 = Passenger.create(name: "Nero", age: 17)
      passenger_3 = Passenger.create(name: "Julius Caeser", age: 22)
      passenger_4 = Passenger.create(name: "Augustus", age: 16)
      passenger_5 = Passenger.create(name: "Claudius", age: 25)

      FlightPassenger.create(flight: flight_1, passenger: passenger_1)
      FlightPassenger.create(flight: flight_1, passenger: passenger_2)
      FlightPassenger.create(flight: flight_1, passenger: passenger_3)
      FlightPassenger.create(flight: flight_1, passenger: passenger_4)
      FlightPassenger.create(flight: flight_1, passenger: passenger_5)

      expect(flight_1.minor_count).to eq([passenger_2, passenger_4])
      expect(flight_1.minor_count.count).to eq(2)
    end

    it "can calculate number of adults" do
      airline_1 = Airline.create(name: "United")
      flight_1 = Flight.create(number: "B5EX", date: "02/24/2020", time: "1:30pm", arrival_city: "Chicago", departure_city: "Denver", airline_id: airline_1.id)

      passenger_1 = Passenger.create(name: "Caligula", age: 22)
      passenger_2 = Passenger.create(name: "Nero", age: 17)
      passenger_3 = Passenger.create(name: "Julius Caeser", age: 22)
      passenger_4 = Passenger.create(name: "Augustus", age: 16)
      passenger_5 = Passenger.create(name: "Claudius", age: 25)

      FlightPassenger.create(flight: flight_1, passenger: passenger_1)
      FlightPassenger.create(flight: flight_1, passenger: passenger_2)
      FlightPassenger.create(flight: flight_1, passenger: passenger_3)
      FlightPassenger.create(flight: flight_1, passenger: passenger_4)
      FlightPassenger.create(flight: flight_1, passenger: passenger_5)

      expect(flight_1.adult_count).to eq([passenger_1, passenger_3, passenger_5])
      expect(flight_1.adult_count.count).to eq(3)
    end
  end
end
