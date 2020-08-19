class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def index
    @bookings = Booking.all
    @bookings.each do |booking|
      booking.status = true
    end
  end

  def show
    @booking = Booking.find(params[:id])
    if @booking.status = true
      @booking.status = "Accepted"
    end
  end

  def edit
    @booking = Booking.find(params[:id])

  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)

    redirect_to bookings_path
  end
  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :customer_id, :plant_sitter_id)
  end
end
