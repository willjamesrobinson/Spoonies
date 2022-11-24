class BookingsController < ApplicationController
  before_action :set_spooner, :set_user, only:[:new, :create]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.spooner = @spooner
    @booking.user = @user # @review.user = current_user
    authorize @booking
    if @booking.save
      redirect_to spooner_path(@spooner)
    else
      render "spooners/new"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @bookmark.destroy
    authorize @booking
    redirect_to root_path
  end

  def my_bookings
    @bookings = current_user.bookings.order(date: :desc)
    @pending_bookings = @bookings.where(pending: true)
    @active_bookings = @bookings.where(pending: false)
    authorize @bookings
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
