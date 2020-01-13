class Passenger < ApplicationRecord
  has_many :flight_passengers
end
