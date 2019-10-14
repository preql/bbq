class UserMailer < ApplicationMailer
  def send_welcome(user)
    @user = user

    mail to: user.email, subject: "Добро пожаловать на мой сайт #{user.name}"
  end
end
