# Preview all emails at http://localhost:3000/rails/mailers/gamer_mailer
class GamerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/gamer_mailer/account_activation
  def account_activation
    gamer = Gamer.first
    gamer.activation_token = Gamer.new_token
    GamerMailer.account_activation(gamer)

  end

  # Preview this email at
  # http://localhost:3000/rails/mailers/gamer_mailer/password_reset
  def password_reset
    gamer = Gamer.first
    gamer.reset_token = Gamer.new_token
    GamerMailer.password_reset(gamer)
  end

end
