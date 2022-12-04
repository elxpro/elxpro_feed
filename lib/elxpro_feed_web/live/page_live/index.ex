defmodule ElxproFeedWeb.PageLive.Index do
  use ElxproFeedWeb, :live_view
  alias ElxproFeedWeb.PageLive.Feed
  alias ElxproFeedWeb.PageLive.Sidebar

  def mount(_, _, socket) do
    feeds = [
      %{
        id: "123",
        avatar_url: "https://avatars.githubusercontent.com/u/12762300?v=4",
        author: "Gustavo Oliveira",
        role: "Elixir Developer",
        comments: [
          %{
            id: "432",
            content: "Pumpkin 123"
          }
        ]
      },
      %{
        id: "1234",
        avatar_url: "https://avatars.githubusercontent.com/u/12762300?v=4",
        author: "Joe Morris",
        role: "Principal Engineer",
        comments: []
      }
    ]

    {:ok, assign(socket, feeds: feeds)}
  end
end
