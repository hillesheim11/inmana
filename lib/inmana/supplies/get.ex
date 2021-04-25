defmodule Inmana.Supplies.Get do
  alias Inmana.{Repo, Supply}

  # Forma de escrever o código utilizando Pattern Match com case
  def call(uuid) do
    case Repo.get(Supply, uuid) do
      nil -> {:error, %{result: "Supply not found", status: :not_found}}
      supply -> {:ok, supply}
    end
  end

  # Outra forma de escrever o código utilizando Pattern Match com funções

  # def call(uuid) do
  #   Supply
  #   |> Repo.get(uuid)
  #   |> handle_show()
  # end

  # defp handle_show(%Supply{} = result), do: {:ok, result}

  # defp handle_show(nil) do
  #   {:error, %{result: "Supply not found", status: :not_found}}
  # end
end
