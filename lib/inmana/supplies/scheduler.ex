defmodule Inmana.Supplies.Scheduler do
  use GenServer

  alias Inmana.Supplies.ExpirationNotification

  # CLIENT
  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  # SERVER

  def init(state \\ %{}) do
    schedule_notification()
    {:ok, state}
  end

  def handle_info(:generate, state) do
    ExpirationNotification.send()

    schedule_notification()

    {:noreply, state}
  end

  defp schedule_notification do
    Process.send_after(self(), :generate, 1000 * 60 * 60 * 24 * 7)
  end

  # ------------------------------------------------- #

  # async
  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  # sync
  def handle_call({:get, key}, _, state) do
    {:reply, Map.get(state, key), state}
  end
end
