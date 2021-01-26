defmodule TestWeb.Item do
  use Phoenix.LiveView

  def mount(_params, %{"item_uuid" => item_uuid} = _session, socket) do
    {:ok, assign(socket, item_uuid: item_uuid)}
  end

  def render(assigns) do
    ~L"""
    <div>
      <%= @item_uuid %>
    </div>
    """
  end
end
