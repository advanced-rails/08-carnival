class ShipsController < ApplicationController
  before_action :auth_admin

  def index
    @ships = Ship.all
  end

  def new
    @ship = Ship.new
  end

  def create
    @ship = Ship.new(params[:ship].permit(:name, :photo))
    if @ship.save
      redirect_to ships_path
    else
      render 'new'
    end
  end

  def destroy
    ship = Ship.find(params[:id])
    ship.destroy
    redirect_to ships_path
  end
end
