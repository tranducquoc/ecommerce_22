require 'test_helper'

class ProductMaillerMailerTest < ActionMailer::TestCase
  test "regiter_product" do
    mail = ProductMaillerMailer.regiter_product
    assert_equal "Regiter product", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
