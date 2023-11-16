class BookingsController < ApplicationController
  def create
    @property = Property.find(params[:property_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.property = @property
    if @booking.save
      flash[:notice] = "Booking created!"
      redirect_to my_bookings_path(@mybookings)
    else
      render "properties/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
