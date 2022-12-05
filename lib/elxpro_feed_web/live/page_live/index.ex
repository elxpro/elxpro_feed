defmodule ElxproFeedWeb.PageLive.Index do
  use ElxproFeedWeb, :live_view
  alias ElxproFeed.Feeds
  alias ElxproFeedWeb.PageLive.Feed
  alias ElxproFeedWeb.PageLive.Sidebar

  def mount(_, _, socket) do
    feeds = Feeds.list()
    {:ok, assign(socket, feeds: feeds)}
  end
end
