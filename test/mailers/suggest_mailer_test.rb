require 'test_helper'

class SuggestMailerTest < ActionMailer::TestCase
  test "resuggest_user" do
    mail = SuggestMailer.resuggest_user
    assert_equal "Resuggest user", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
