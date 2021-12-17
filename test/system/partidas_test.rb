require "application_system_test_case"

class PartidasTest < ApplicationSystemTestCase
  setup do
    @partida = partidas(:one)
  end

  test "visiting the index" do
    visit partidas_url
    assert_selector "h1", text: "Partidas"
  end

  test "creating a Partida" do
    visit partidas_url
    click_on "New Partida"

    fill_in "Cog2011", with: @partida.cog2011
    fill_in "Descripcion", with: @partida.descripcion
    fill_in "Descripcion2", with: @partida.descripcion2
    fill_in "Indice", with: @partida.indice
    fill_in "Partida", with: @partida.partida
    click_on "Create Partida"

    assert_text "Partida was successfully created"
    click_on "Back"
  end

  test "updating a Partida" do
    visit partidas_url
    click_on "Edit", match: :first

    fill_in "Cog2011", with: @partida.cog2011
    fill_in "Descripcion", with: @partida.descripcion
    fill_in "Descripcion2", with: @partida.descripcion2
    fill_in "Indice", with: @partida.indice
    fill_in "Partida", with: @partida.partida
    click_on "Update Partida"

    assert_text "Partida was successfully updated"
    click_on "Back"
  end

  test "destroying a Partida" do
    visit partidas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Partida was successfully destroyed"
  end
end
