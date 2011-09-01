require 'test_helper'

class ScheduleControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get team" do
    get :team
    assert_response :success
  end

end
