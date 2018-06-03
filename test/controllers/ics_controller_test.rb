require 'test_helper'

class IcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ic = ics(:one)
  end

  test "should get index" do
    get ics_url
    assert_response :success
  end

  test "should get new" do
    get new_ic_url
    assert_response :success
  end

  test "should create ic" do
    assert_difference('Ic.count') do
      post ics_url, params: { ic: { content: @ic.content, image: @ic.image, user_id: @ic.user_id } }
    end

    assert_redirected_to ic_url(Ic.last)
  end

  test "should show ic" do
    get ic_url(@ic)
    assert_response :success
  end

  test "should get edit" do
    get edit_ic_url(@ic)
    assert_response :success
  end

  test "should update ic" do
    patch ic_url(@ic), params: { ic: { content: @ic.content, image: @ic.image, user_id: @ic.user_id } }
    assert_redirected_to ic_url(@ic)
  end

  test "should destroy ic" do
    assert_difference('Ic.count', -1) do
      delete ic_url(@ic)
    end

    assert_redirected_to ics_url
  end
end
