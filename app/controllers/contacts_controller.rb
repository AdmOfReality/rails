class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.with(contact: @contact).send_contact_email.deliver_now
      redirect_to contact_path, notice: t('.notice')
    else
      flash.now[:alert] = t('.alert')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
