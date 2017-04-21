require 'test_helper'

class OrderUserMailerTest < ActionMailer::TestCase
  test "order_to_user" do
    mail = OrderUserMailer.order_to_user
    assert_equal "Order to user", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
