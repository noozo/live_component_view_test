defmodule TestWeb.Comp do
  use Phoenix.LiveComponent

  def update(%{id: id, items: items} = _assigns, socket) do
    {:ok, assign(socket, id: id, items: items, latest_item: 3)}
  end

  def render(assigns) do
    ~L"""
    <div id="<%= @id %>">
      <div phx-click="add-item" phx-target="<%= @myself %>">
        Add Item
      </div>
      <%= for item <- @items do %>
        <span phx-click="remove-item"
              phx-value-item_uuid="<%= item.uuid %>"
              phx-target="<%= @myself %>"
              style="float: right;">
          X
        </span>
        <%= live_render @socket, TestWeb.Item, id: "item_#{item.uuid}", session: %{"item_uuid" => item.uuid} %>
      <% end %>
    </div>
    """
  end

  def handle_event("add-item", _event, socket) do
    latest_item = socket.assigns.latest_item + 1
    items = socket.assigns.items ++ [%{uuid: "#{latest_item}"}]
    {:noreply, assign(socket, latest_item: latest_item, items: items)}
  end

  def handle_event("remove-item", %{"item_uuid" => item_uuid} = _event, socket) do
    items = Enum.reject(socket.assigns.items, & &1.uuid == item_uuid)
    {:noreply, assign(socket, items: items)}
  end
end
