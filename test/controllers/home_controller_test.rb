require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get team" do
    get home_team_url
    assert_response :success
  end

  test "should get simplon" do
    get home_simplon_url
    assert_response :success
  end

  test "should get thp" do
    get home_thp_url
    assert_response :success
  end

end
