require 'test_helper'

class IndividualPokemonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get individual_pokemons_index_url
    assert_response :success
  end

  test "should get new" do
    get individual_pokemons_new_url
    assert_response :success
  end

  test "should get create" do
    get individual_pokemons_create_url
    assert_response :success
  end

end
