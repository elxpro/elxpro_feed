defmodule ElxproFeedWeb.PageLive.Feed.CommentTest do
  use ElxproFeedWeb.ConnCase
  import ElxproFeed.CommentsFixtures
  import Phoenix.LiveViewTest

  test "load main comment elements", %{conn: conn} do
    comment = comment_fixture()

    {:ok, view, _html} = live(conn, ~p"/")

    comment_id = comment.id
    assert has_element?(view, "#comment-#{comment_id}")
    assert has_element?(view, "[data-role=avatar][data-id=#{comment_id}]")
    assert has_element?(view, "[data-role=user-name][data-id=#{comment_id}]", "Gustavo Oliveira")
    assert has_element?(view, "[data-role=date][data-id=#{comment_id}]")
    assert has_element?(view, "[data-role=delete][data-id=#{comment_id}]")
    assert has_element?(view, "[data-role=content][data-id=#{comment_id}]")
    assert has_element?(view, "[data-role=footer][data-id=#{comment_id}]")
    assert has_element?(view, "[data-role=like][data-id=#{comment_id}]", "Like")
  end
end
