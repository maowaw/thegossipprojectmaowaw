require 'test_helper'

class GossipsControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get gossips_display_url
    assert_response :success
  end

end
