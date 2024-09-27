class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.with(contact: @contact).send_contact_email.deliver_now
      redirect_to contact_path, notice: 'Ваше сообщение было успешно отправлено.'
    else
      flash.now[:alert] = 'Пожалуйста, исправьте ошибки в форме.'
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
