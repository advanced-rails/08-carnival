class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(params[:city].permit(:name, :country, :photo))
    if @city.save
      redirect_to cities_path
    else
      render 'new'
    end
  end
end
