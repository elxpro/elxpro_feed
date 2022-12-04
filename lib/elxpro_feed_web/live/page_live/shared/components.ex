defmodule ElxproFeedWeb.PageLive.Shared.Components do
  use Phoenix.Component

  attr :img_url, :string, default: "https://avatars.githubusercontent.com/u/12762300?v=4"
  attr :data_role, :string, required: true
  attr :data_id, :string, default: ""
  attr :has_border, :boolean, default: true

  def avatar(assigns) do
    ~H"""
    <img
      data-role={@data_role}
      data-id={@data_id}
      src={@img_url}
      alt=""
      class={[
        @has_border && "border-blue-700 border-2",
        "w-16 h-16 rounded-lg outline-2 outline-blue-300"
      ]}
    />
    """
  end
end
