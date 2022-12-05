defmodule ElxproFeed.FeedsFixtures do
  def feed_fixture(attrs \\ %{}) do
    {:ok, feed} =
      attrs
      |> Enum.into(%{
        content: "some content",
        avatar_url: "https://avatars.githubusercontent.com/u/12762300?v=4",
        role: "Software Engineer",
        author: "Gustavo Oliveira"
      })
      |> ElxproFeed.Feeds.create_feed()

    feed
  end
end
