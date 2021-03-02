class MessagesMailer < ApplicationMailer
  def contact(data)
    @email = data.email
    @message = data.message

    mail to: 'tatianaboltach@gmail.com'
  end
end