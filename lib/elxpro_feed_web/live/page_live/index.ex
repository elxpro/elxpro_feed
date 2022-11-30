defmodule ElxproFeedWeb.PageLive.Index do
  use ElxproFeedWeb, :live_view
  alias ElxproFeedWeb.PageLive.Sidebar

  def mount(_, _, socket) do
    feeds = [
      %{
        id: "123",
        avatar_url: "https://avatars.githubusercontent.com/u/12762300?v=4",
        author: "Gustavo Oliveira",
        role: "Elixir Developer"
      },
      %{
        id: "1234",
        avatar_url: "https://avatars.githubusercontent.com/u/12762300?v=4",
        author: "Joe Morris",
        role: "Principal Engineer"
      }
    ]

    {:ok, assign(socket, feeds: feeds)}
  end
end
