class BookingsController < ApplicationController
  before_action :set_spooner, :set_user, only:[:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.spooner = @spooner
    @booking.user = @user
    if @booking.save
      redirect_to spooner_path(@spooner)
    else
      render "spooners/new"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @bookmark.destroy
    redirect_to root_path
  end

  def my_bookings
    @bookings = current_user.bookings.order(date: :desc)
    @pending_bookings = @bookings.where(pending: true)
    @active_bookings = @bookings.where(pending: false)
  end
  private

  def booking_params
    params.require(:booking).permit(:date, :details)
  end

  def set_spooner
    @spooner = Spooner.find(params[:spooner_id])
  end

  def set_user
    @user = User.find(current_user.id)
  end

end
