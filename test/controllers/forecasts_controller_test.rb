require 'test_helper'

class ForecastsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get forecasts_show_url
    assert_response :success
  end

  test "should get statistics" do
    get forecasts_statistics_url
    assert_response :success
  end

end
