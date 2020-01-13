class PassengersController < ApplicationController

  def show
    @passenger = Passenger.find(params[:id])
  end

  def update
    passenger = Passenger.find(params[:id])
    flight = Flight.find_by(params[number: :flight_number])
    FlightPassenger.create(passenger: passenger, flight: flight)
    redirect_to "/passengers/#{passenger.id}"
  end

  private

  def flight_params
    params.permit(:number)
  end
end
