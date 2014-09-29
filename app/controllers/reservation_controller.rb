class ReservationController < ApplicationController

  def index
  end

  def create
    if true#validate_params(reservation_params)
      @message = 'success'
    else
      @message = 'false'#['false', 1, 2, 3]
    end

    redirect_to reservation_path, notice: @message
  end

  private
  def validate_params(params)
    # EMAIL_REG = /[a-zA-Z0-9._%-]+@(?:[a-zA-Z0-9-]+\.)+(com|net|org|info|biz|me|edu|gov)/i

    validates           :sender, :body, presence: {message: I18n.t(:"messages.invalid")}
    validates_format_of :sender,    with: EMAIL_REG, message: I18n.t(:"messages.invalid_email")

  end
  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :guests, :room_types, :name, :phone, :email, :request)
  end
end