require 'test_helper'

class SellproductControllerTest < ActionController::TestCase
  test "should get viewsellproduct" do
    get :viewsellproduct
    assert_response :success
  end

end
