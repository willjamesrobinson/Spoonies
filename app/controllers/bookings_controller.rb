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
    # raise
    @booking.destroy
    redirect_to "/bookings/my_bookings"
  end

  def my_bookings
    @bookings = current_user.bookings.order(date: :desc)
    @pending_bookings = @bookings.where(pending: true)
    @active_bookings = @bookings.where(pending: false)
    # bookings.date = @bookings do
    # @past_bookings =
    # @past_bookings = past_bookings(@bookings)
  end

  # def past_bookings(bookings)
  #   past = []
  #   bookings.each do |booking|
  #     new_date = booking.date.split("T").join(" ")
  #     puts new_date
  #     DateTime.strptime(new_date)
  #     if booking.date.past?
  #       past << booking
  #     end
  #   end
  #   return past
  # end
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
