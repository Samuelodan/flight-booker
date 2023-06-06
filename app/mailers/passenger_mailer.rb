class PassengerMailer < ApplicationMailer
  default from: 'updates@example.com'

  def ticket_email
    @passenger = params[:passenger]
    mail(to: @passenger.email, subject: "Thank you for booking a flight with us")
  end
end
