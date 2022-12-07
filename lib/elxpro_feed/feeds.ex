defmodule ElxproFeed.Feeds do
  alias __MODULE__.Feed
  alias ElxproFeed.Comments.Comment
  alias ElxproFeed.Repo

  import Ecto.Query

  def list do
    Repo.all(Feed) |> Repo.preload(:comments)
  end

  def create_feed(attrs) do
    %Feed{}
    |> Feed.changeset(attrs)
    |> Repo.insert()
  end

  def get_comments(feed_id) do
    Comment
    |> where([c], c.feed_id == ^feed_id)
    |> Repo.all()
  end
end
