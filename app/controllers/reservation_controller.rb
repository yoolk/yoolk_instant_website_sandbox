class ReservationController < ApplicationController
  def index
    @reservation = Yoolk::Form::Reservation.new
  end

  def create
    @reservation = Yoolk::Form::Reservation.new(reservation_params)

    if @reservation.valid?
      redirect_to reservation_index_path, notice: 'Thank you for submitting your reservation.'
    else
      render :index
    end
  end

  private

    def reservation_params
      params.require(:reservation).permit(:check_in, :check_out, :guests, :room_types, :name, :phone, :sender, :body)
    end
end