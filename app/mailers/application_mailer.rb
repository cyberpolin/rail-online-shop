class ApplicationMailer < ActionMailer::Base
  default from: "hire@cyberpolin.com"
  layout 'mailer'

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end
