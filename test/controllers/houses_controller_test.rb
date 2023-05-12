require "test_helper"

class HousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @house = houses(:one)
  end

  test "should get index" do
    get houses_url
    assert_response :success
  end

  test "should get new" do
    get new_house_url
    assert_response :success
  end

  test "should create house" do
    assert_difference("House.count") do
      post houses_url, params: { house: { allergie: @house.allergie, animali: @house.animali, data_in: @house.data_in, data_out: @house.data_out, desc_casa: @house.desc_casa, desc_quartiere: @house.desc_quartiere, n_bagni: @house.n_bagni, n_camere: @house.n_camere, n_cucine: @house.n_cucine, n_culle: @house.n_culle, n_divani: @house.n_divani, n_doppi: @house.n_doppi, n_singoli: @house.n_singoli, n_soggiorni: @house.n_soggiorni, place_id: @house.place_id, superficie: @house.superficie, tipologia: @house.tipologia, user_id: @house.user_id } }
    end

    assert_redirected_to house_url(House.last)
  end

  test "should show house" do
    get house_url(@house)
    assert_response :success
  end

  test "should get edit" do
    get edit_house_url(@house)
    assert_response :success
  end

  test "should update house" do
    patch house_url(@house), params: { house: { allergie: @house.allergie, animali: @house.animali, data_in: @house.data_in, data_out: @house.data_out, desc_casa: @house.desc_casa, desc_quartiere: @house.desc_quartiere, n_bagni: @house.n_bagni, n_camere: @house.n_camere, n_cucine: @house.n_cucine, n_culle: @house.n_culle, n_divani: @house.n_divani, n_doppi: @house.n_doppi, n_singoli: @house.n_singoli, n_soggiorni: @house.n_soggiorni, place_id: @house.place_id, superficie: @house.superficie, tipologia: @house.tipologia, user_id: @house.user_id } }
    assert_redirected_to house_url(@house)
  end

  test "should destroy house" do
    assert_difference("House.count", -1) do
      delete house_url(@house)
    end

    assert_redirected_to houses_url
  end
end
