class DoMail < ApplicationMailer
   def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Hunter\'s Hella Hot Shoppe')
  end
  def order_email(user)
    @user = user
    mail(to: user.email, subject: 'Nice shoppe!')
  end
end
