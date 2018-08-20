require 'test_helper'

class GamerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @gamer = Gamer.new(username: "Example User", email: "user@example.com",
    password: "foobar", password_confirmation: "foobar")
  end


  test "authenticated? should return false for a user with nil digest" do
    assert_not @gamer.authenticated?(:remember, '')
  end
end
