class ReservationController < ApplicationController
  def index
  end

  def create
    redirect_to reservation_path
  end
end