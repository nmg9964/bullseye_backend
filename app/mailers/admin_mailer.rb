class AdminMailer < ApplicationMailer

  def notification_message(admin)
    @admin = admin
    @event = admin.events.last
    mail(to: @admin.email_address, subject: 'New BullsEye Axe Lounge Session')
  end

end
