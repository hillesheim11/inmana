defmodule InmanaWeb.WelcomeControllerTest do
  use InmanaWeb.ConnCase

  describe "welcome/2" do
    test "when the user is special, returns special message",
         %{conn: conn} do
      params = %{name: "Lucas Hillesheim", age: "42"}

      response =
        conn
        |> get(Routes.welcome_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{
        "message" => "You are very special lucas hillesheim"
      }

      assert response == expected_response
    end

    test "when the user is not special, returns a message",
         %{conn: conn} do
      params = %{name: "Lucas Hillesheim", age: "26"}

      response =
        conn
        |> get(Routes.welcome_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{
        "message" => "Welcome lucas hillesheim"
      }

      assert response == expected_response
    end

    test "when the user is under age, returns an error",
         %{conn: conn} do
      params = %{name: "Lucas Hillesheim", age: "14"}

      response =
        conn
        |> get(Routes.welcome_path(conn, :index, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => "You shall not pass lucas hillesheim"
      }

      assert response == expected_response
    end
  end
end
