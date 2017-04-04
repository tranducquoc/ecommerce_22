# Preview all emails at http://localhost:3000/rails/mailers/suggest_mailer
class SuggestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/suggest_mailer/resuggest_user
  def resuggest_user
    SuggestMailer.resuggest_user(User.first, Suggest.first.id)
  end

end
