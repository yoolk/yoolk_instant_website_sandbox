class ContactUsController < ApplicationController

  def index
    @contact = Yoolk::Form::Contact.new
  end

  def create
    @contact = Yoolk::Form::Contact.new(contact_params)

    if @contact.valid?
      redirect_to contact_us_path, notice: 'Your email was sent successfully. We will respond you back shortly.'
    else
      render :index
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :phone, :sender, :body)
    end
end