class ReservationsController < ApplicationController
  before_action :auth_user

  def index
    @reservations = @user.reservations
  end

  def new
    @cruises = Cruise.all
  end

  def select_cruise
    @cruise = Cruise.find(params[:cruise_id])
    @dates = @cruise.dates
    render 'new'
  end

  def select_date
    @reservation = Reservation.new
    @cruise = Cruise.find(params[:cruise_id])
    @date = params[:date].to_date
    reserved_rooms = Reservation.where(date: @date).map{|c| "#{c.room}/#{c.level}"}
    all_rooms = @cruise.ship.cabins.map{|c| "#{c.room}/#{c.level}"}
    @available_rooms = all_rooms - reserved_rooms
    render 'new'
  end

  def create
    @cruise = Cruise.find(params[:reservation][:cruise_id])
    @reservation = Reservation.new(params[:reservation].permit(:cruise_id, :date))
    room, level = params[:reservation][:room_level].split('/')
    @reservation.room = room
    @reservation.level = level
    @reservation.cost = @cruise.base_cost + (100 * @reservation.level)
    @reservation.user_id = @user.id
    @reservation.save
    redirect_to reservations_url
  end
end
