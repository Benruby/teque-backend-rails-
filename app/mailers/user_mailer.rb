class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
  	@user = user
    mail to: user.email, subject: "hello"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, :subject => "איפוס סיסמה - Teque"
  end

  def notify_admin(contact)
    @contact = contact
    mail to: ENV["ADMIN_EMAIL"], :subject => "new contact from Teque"
  end
end
