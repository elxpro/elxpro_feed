defmodule ElxproFeed.CommentsFixtures do
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
        likes: 42
      })
      |> ElxproFeed.Comments.create_comment()

    comment
  end
end
