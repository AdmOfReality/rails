class ContactMailer < ApplicationMailer
  default from: 'no-reply@railsapp.heroku.com'

  def send_contact_email
    @contact = params[:contact]
    mail(to: 'angrysgr@gmail.com', subject: 'Новое сообщение с формы обратной связи')
  end
end
