require "test_helper"

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
    @favorite_pdriver = products(:ps4) 
    @favorite_switch = products(:switch)
  end

  test "should create favorite" do
    assert_difference('Favorite.count', 1) do
      post favorites_url(product_id: @favorite_pdriver.id)
    end

    assert_redirected_to product_path(@favorite_pdriver)
  end

  test "should delete a favorite" do
    assert_difference('Favorite.count', -1) do
      delete favorite_url(@favorite_switch.id)
    end

    assert_redirected_to product_path(@favorite_switch)
  end

  
end
