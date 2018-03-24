require 'test_helper'

class PatiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patio = patios(:one)
  end

  test "should get index" do
    get patios_url
    assert_response :success
  end

  test "should get new" do
    get new_patio_url
    assert_response :success
  end

  test "should create patio" do
    assert_difference('Patio.count') do
      post patios_url, params: { patio: { google_place_id: @patio.google_place_id, has_view: @patio.has_view, is_covered: @patio.is_covered, is_recommended: @patio.is_recommended, seating_location: @patio.seating_location } }
    end

    assert_redirected_to patio_url(Patio.last)
  end

  test "should show patio" do
    get patio_url(@patio)
    assert_response :success
  end

  test "should get edit" do
    get edit_patio_url(@patio)
    assert_response :success
  end

  test "should update patio" do
    patch patio_url(@patio), params: { patio: { google_place_id: @patio.google_place_id, has_view: @patio.has_view, is_covered: @patio.is_covered, is_recommended: @patio.is_recommended, seating_location: @patio.seating_location } }
    assert_redirected_to patio_url(@patio)
  end

  test "should destroy patio" do
    assert_difference('Patio.count', -1) do
      delete patio_url(@patio)
    end

    assert_redirected_to patios_url
  end
end
