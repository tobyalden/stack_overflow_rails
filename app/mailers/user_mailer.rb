class UserMailer < ApplicationMailer
  default from: "admin@stackunderflow"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "Sign up confirmation"

    # # First, instantiate the Mailgun Client with your API key
    # mg_client = Mailgun::Client.new "key-9230a35dbfae9dffe0c54549455138e1"
    #
    # # Define your message parameters
    # message_params = {:from    => 'welcome@stackunderflow.com',
    #                   :to      => @user.email,
    #                   :subject => 'Welcome to Stack Underflow',
    #                   :text    => 'We care because you do.'}
    #
    # # Send your message through the client
    # mg_client.send_message "stackunderflow.com", message_params
  end
end
