class DoMail < ApplicationMailer
   def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Hunter\'s Hella Hot Shoppe')
  end
end
