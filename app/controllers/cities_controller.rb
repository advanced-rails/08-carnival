class CitiesController < ApplicationController
  before_action :auth_admin

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
