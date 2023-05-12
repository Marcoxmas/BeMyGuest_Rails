require "application_system_test_case"

class HousesTest < ApplicationSystemTestCase
  setup do
    @house = houses(:one)
  end

  test "visiting the index" do
    visit houses_url
    assert_selector "h1", text: "Houses"
  end

  test "should create house" do
    visit houses_url
    click_on "New house"

    check "Allergie" if @house.allergie
    fill_in "Animali", with: @house.animali
    fill_in "Data in", with: @house.data_in
    fill_in "Data out", with: @house.data_out
    fill_in "Desc casa", with: @house.desc_casa
    fill_in "Desc quartiere", with: @house.desc_quartiere
    fill_in "N bagni", with: @house.n_bagni
    fill_in "N camere", with: @house.n_camere
    fill_in "N cucine", with: @house.n_cucine
    fill_in "N culle", with: @house.n_culle
    fill_in "N divani", with: @house.n_divani
    fill_in "N doppi", with: @house.n_doppi
    fill_in "N singoli", with: @house.n_singoli
    fill_in "N soggiorni", with: @house.n_soggiorni
    fill_in "Place", with: @house.place_id
    fill_in "Superficie", with: @house.superficie
    fill_in "Tipologia", with: @house.tipologia
    fill_in "User", with: @house.user_id
    click_on "Create House"

    assert_text "House was successfully created"
    click_on "Back"
  end

  test "should update House" do
    visit house_url(@house)
    click_on "Edit this house", match: :first

    check "Allergie" if @house.allergie
    fill_in "Animali", with: @house.animali
    fill_in "Data in", with: @house.data_in
    fill_in "Data out", with: @house.data_out
    fill_in "Desc casa", with: @house.desc_casa
    fill_in "Desc quartiere", with: @house.desc_quartiere
    fill_in "N bagni", with: @house.n_bagni
    fill_in "N camere", with: @house.n_camere
    fill_in "N cucine", with: @house.n_cucine
    fill_in "N culle", with: @house.n_culle
    fill_in "N divani", with: @house.n_divani
    fill_in "N doppi", with: @house.n_doppi
    fill_in "N singoli", with: @house.n_singoli
    fill_in "N soggiorni", with: @house.n_soggiorni
    fill_in "Place", with: @house.place_id
    fill_in "Superficie", with: @house.superficie
    fill_in "Tipologia", with: @house.tipologia
    fill_in "User", with: @house.user_id
    click_on "Update House"

    assert_text "House was successfully updated"
    click_on "Back"
  end

  test "should destroy House" do
    visit house_url(@house)
    click_on "Destroy this house", match: :first

    assert_text "House was successfully destroyed"
  end
end
