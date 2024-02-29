class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.vehicle = @vehicle
    @vehicle.update(take: true)
    if @booking.save!
      redirect_to vehicle_bookings_path(@vehicle), notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.vehicle.update(take: false)
    @booking.destroy
    redirect_to mis_reservas_path, notice: 'Booking was successfully destroyed.'
  end

  private
  def booking_params
    params.require(:booking).permit(:name, :start_date, :end_date)
  end
end
