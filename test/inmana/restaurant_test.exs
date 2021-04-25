defmodule Inmana.RestaurantTest do
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Lucas", email: "email@test.com.br"}

      response = Restaurant.changeset(params)

      # Em vez de usar ==, usamos = pois estamos utilizando o pattern match
      assert %Changeset{
               changes: %{email: "email@test.com.br", name: "Lucas"},
               valid?: true
             } = response
    end

    test "when there are invalid params, returns a invalid changeset" do
      params = %{name: "L", email: ""}

      response = Restaurant.changeset(params)

      assert %Changeset{
               valid?: false
             } = response

      expected_response_error = %{
        email: ["can't be blank"],
        name: ["should be at least 2 character(s)"]
      }

      assert errors_on(response) == expected_response_error
    end
  end
end
