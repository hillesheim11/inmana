defmodule InmanaWeb.RestaurantControllerTest do
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "when all params are valid, creates the restaurant",
         %{conn: conn} do
      params = %{name: "Lucas", email: "email@test.com.br"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "email@test.com.br",
                 "id" => _restaurant_id,
                 "name" => "Lucas"
               }
             } = response
    end

    test "when there are invalid params, returns an error",
         %{conn: conn} do
      params = %{email: "email@test.com.br"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "name" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end
end
