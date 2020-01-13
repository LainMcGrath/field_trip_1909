class PassengersController < ApplicationController

  def show
    @passenger = Passenger.find(params[:id])
  end

  def update
    passenger = Passenger.find(params[:id])
    current_flights = passenger.flights.all
    # require "pry"; binding.pry
    redirect_to "/passengers/#{passenger.id}"
  end
end
