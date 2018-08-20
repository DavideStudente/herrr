require 'test_helper'

class ArenaPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get arena" do
    get arena_pages_arena_url
    assert_response :success
  end

end
