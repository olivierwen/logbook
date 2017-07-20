class FlightsController < ApplicationController
  before_action :require_permission, only: %i[edit destroy]

  # GET /flights
  # GET /flights.json
  def index
    @flights = Flight.all
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        session[:flight_id] = @flight.id
        format.html { redirect_to @flight, notice: 'Le vol a correctement été déclaré.' }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  def flight_params
    params.require(:flight).permit(:reference,:startplace, :stopplace, :description, :duration, :length)
  end
end
