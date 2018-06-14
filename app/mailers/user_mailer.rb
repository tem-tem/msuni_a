class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.log_in.subject
  #

  default from: "no-reply@msuniversity.ru"
  layout 'mailer'

  def log_in(user)
    @user = user
    mail to: user.email, subject: "Доступ в админку MSUniversity"
  end
end
