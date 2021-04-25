defmodule Inmana.RestaurantsViewTests do
  use InmanaWeb.ConnCase

  import Phoenix.View

  alias Inmana.Restaurant
  alias InmanaWeb.RestaurantsView

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Agro", email: "agro@email.com.br"}
      {:ok, restaurant} = Inmana.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created!",
               restaurant: %Restaurant{
                 email: "agro@email.com.br",
                 id: _id,
                 name: "Agro"
               }
             } = response
    end
  end
end
