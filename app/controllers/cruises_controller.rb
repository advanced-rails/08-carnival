class CruisesController < ApplicationController
  before_action :auth_admin

  def index
    @cruises = Cruise.all
  end

  def new
    @cruise = Cruise.new
    @ships = Ship.all
  end

  def create
    @cruise = Cruise.new(params[:cruise].permit(:name, :duration, :base_cost, :ship_id))
    @cruise.dates = params[:cruise][:dates].split(',').map(&:to_date)

    if @cruise.save
      redirect_to cruises_path
    else
      @ships = Ship.all
      render 'new'
    end
  end

  def destroy
    cruise = Cruise.find(params[:id])
    cruise.destroy
    redirect_to cruises_path
  end

  def show
    @cruise = Cruise.find(params[:id])
    @cities = City.all
  end

  def add_date
    cruise = Cruise.find(params[:id])
    date = Date.new(params['date(1i)'].to_i, params['date(2i)'].to_i, params['date(3i)'].to_i)
    cruise.dates << date
    cruise.save
    redirect_to cruise
  end

  def add_city
    cruise = Cruise.find(params[:id])
    city = City.find(params[:city_id])
    cruise.cities << city
    redirect_to cruise
  end
end
