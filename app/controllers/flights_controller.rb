class FlightsController < ApplicationController
  before_action :require_permission, only: %i[edit destroy]
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

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

  # Load stats for home page
  def stats
    # nb of flight last 30days
    @nb_flights_30d = Flight.where('created_at > ?', 30.days.ago).count
    # top 3 longest flights
    @longest_flight = Flight.all.order('length desc').limit(3)
  end

  def create
    @flight = Flight.new(flight_params)
    @flight.pilot_id = session[:pilot_id]

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end
end
