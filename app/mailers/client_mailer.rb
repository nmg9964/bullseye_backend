class ClientMailer < ApplicationMailer

  def confirmation_email(event)
    @event = event
    mail(to: @event.email_address, subject: 'Your BullsEye Axe Lounge Session')
  end

end
