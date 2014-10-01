class ReservationController < ApplicationController

  def index
  end

  def create
    @message = validate_params(reservation_params)
    redirect_to reservation_path, notice: @message#I18n.t('sample.welcome')
  end

  private
  def validate_params(params)
    email_reg = /[a-zA-Z0-9._%-]+@(?:[a-zA-Z0-9-]+\.)+(com|net|org|info|biz|me|edu|gov)/i

    ary = []
    ary.push 'Email is not provided'           unless params[:email].present?
    ary.push 'Email validation fail'           unless params[:email].match(email_reg)
    ary.push 'Special request is not provided' unless params[:request].present?
    ary.push 'Validation passed'               if ary.empty?

    ary
  end

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :guests, :room_types, :name, :phone, :email, :request)
  end
end
