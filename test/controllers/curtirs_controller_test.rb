require 'test_helper'

class CurtirsControllerTest < ActionDispatch::IntegrationTest
  test "should get postagem:references" do
    get curtirs_postagem:references_url
    assert_response :success
  end

end
