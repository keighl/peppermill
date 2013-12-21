class UserMailer < ActionMailer::Base
  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(:host => ROOT_HOST, :id => @user.reset_password_token)
    mail(:to => @user.email, :subject => t("emails.password_reset.subject"))
  end
end
