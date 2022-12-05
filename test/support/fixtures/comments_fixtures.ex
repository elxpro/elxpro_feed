defmodule ElxproFeed.CommentsFixtures do
  import ElxproFeed.FeedsFixtures

  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElxproFeed.Comments` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        content: "some content",
        likes: 42,
        feed_id: feed_fixture().id
      })
      |> ElxproFeed.Comments.create_comment()

    comment
  end
end
