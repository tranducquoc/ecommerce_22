class SuggestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.suggest_mailer.resuggest_user.subject
  #
  def resuggest_user user, id
    @user = user
    @id = id
    mail to: user.email, subject: "Your suggest...."
  end
end
