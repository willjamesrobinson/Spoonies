class BookingsController < ApplicationController
  before_action :set_spooner,

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.spooner = @spooner
    @booking.user = @user
    if @booking.save
      redirect_to
    else
      render "spooners/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @bookmark.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :description, :user_id)
  end

  def set_spooner
    @spooner = Spooner.find(params[:spooner_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
