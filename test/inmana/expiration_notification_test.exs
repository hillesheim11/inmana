defmodule Inmana.ExpirationNotificationTest do
  use InmanaWeb.ConnCase

  alias Inmana.Supplies.ExpirationNotification

  describe "send/0" do
    test "when send the notification for supplies expiration date" do
      response = ExpirationNotification.send()

      assert response == :ok
    end
  end
end
