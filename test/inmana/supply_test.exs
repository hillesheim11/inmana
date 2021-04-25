defmodule Inmana.SupplyTest do
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Supply

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        description: "Carne moída 2kg",
        expiration_date: "2021-05-15",
        responsible: "João Vitor",
        restaurant_id: "2cfeb4d0-7de3-46de-97e7-ee6664872fee"
      }

      response = Supply.changeset(params)

      assert %Changeset{
               changes: %{
                 description: "Carne moída 2kg",
                 expiration_date: ~D[2021-05-15],
                 responsible: "João Vitor",
                 restaurant_id: "2cfeb4d0-7de3-46de-97e7-ee6664872fee"
               },
               valid?: true
             } = response
    end

    test "when there are invalid params, returns a invalid changeset" do
      params = %{
        description: "Ca",
        responsible: "Jo"
      }

      response = Supply.changeset(params)

      assert %Changeset{
               valid?: false
             } = response

      expected_response_error = %{
        description: ["should be at least 3 character(s)"],
        expiration_date: ["can't be blank"],
        responsible: ["should be at least 3 character(s)"],
        restaurant_id: ["can't be blank"]
      }

      assert errors_on(response) == expected_response_error
    end
  end
end
