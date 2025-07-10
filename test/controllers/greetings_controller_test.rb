require "test_helper"

class GreetingsControllerTest < ActionDispatch::IntegrationTest
  test "should get helloworld" do
    get greetings_helloworld_url
    assert_response :success
  end
end
