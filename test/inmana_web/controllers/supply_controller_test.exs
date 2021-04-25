defmodule InmanaWeb.SupplyControllerTest do
  use InmanaWeb.ConnCase

  setup %{conn: conn} do
    params = %{name: "Lucas", email: "email@test.com.br"}

    conn
    |> post(Routes.restaurants_path(conn, :create, params))
    |> json_response(:created)
  end

  describe "create/2" do
    test "when all params are valid, creates the supply", setup do
      conn = setup[:conn]
      restaurant_id = setup["restaurant"]["id"]

      params = %{
        description: "Carne moída 2kg",
        expiration_date: "2021-05-15",
        responsible: "Lucas Hillesheim",
        restaurant_id: restaurant_id
      }

      response =
        conn
        |> post(Routes.supplies_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Supply created!",
               "supply" => %{
                 "description" => "Carne moída 2kg",
                 "expiration_date" => "2021-05-15",
                 "id" => _supply_id,
                 "responsible" => "Lucas Hillesheim",
                 "restaurant_id" => _restaurant_id
               }
             } = response
    end

    test "when there are invalid params, returns an error", setup do
      conn = setup[:conn]

      params = %{
        description: "Ca",
        responsible: "Jo"
      }

      expected_response_error = %{
        "message" => %{
          "description" => ["should be at least 3 character(s)"],
          "expiration_date" => ["can't be blank"],
          "responsible" => ["should be at least 3 character(s)"],
          "restaurant_id" => ["can't be blank"]
        }
      }

      response =
        conn
        |> post(Routes.supplies_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response_error
    end
  end

  setup setup do
    conn = setup[:conn]
    restaurant_id = setup["restaurant"]["id"]

    params = %{
      description: "Carne moída 2kg",
      expiration_date: "2021-05-15",
      responsible: "Lucas Hillesheim",
      restaurant_id: restaurant_id
    }

    conn
    |> post(Routes.supplies_path(conn, :create, params))
    |> json_response(:created)
  end

  describe "show/2" do
    test "when all params are valid, show the supply", setup do
      conn = setup[:conn]
      supply_id = setup["supply"]["id"]

      response =
        conn
        |> get(Routes.supplies_path(conn, :show, supply_id))
        |> json_response(:ok)

      assert %{
               "supply" => %{
                 "description" => "Carne moída 2kg",
                 "expiration_date" => "2021-05-15",
                 "id" => _supply_id,
                 "responsible" => "Lucas Hillesheim",
                 "restaurant_id" => _restaurant_id
               }
             } = response
    end
  end
end
