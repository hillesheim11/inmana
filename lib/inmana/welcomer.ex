defmodule Inmana.Welcomer do
  # Receber um nome e uma idade do usuario
  # Se o usuario chamar banana e tiver idade"42"
  # Ele recebe uma mensagem especial
  # Se o usuario for maior de idade, ele recebe uma mensaem normal
  # Se o usuario for menor de idade, retornamos um erro
  # Temos que tratar o nome do usuario para entradas erradas, como "BaNaNa", " BaNaNa  \n"

  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate(name, 42) do
    {:ok, "You are very special #{name}"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass #{name}"}
  end
end
