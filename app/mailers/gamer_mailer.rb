class GamerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.gamer_mailer.account_activation.subject
  #
  def account_activation(gamer)
    @gamer = gamer
    mail to: gamer.email, subject: "Account activation"

  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.gamer_mailer.password_reset.subject
  #
  def password_reset(gamer)
    @gamer = gamer
    mail to: gamer.email, subject: "Password reset"
  end
end
