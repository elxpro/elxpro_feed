defmodule ElxproFeedWeb.PageLive.FeedTest do
  use ElxproFeedWeb.ConnCase
  import Phoenix.LiveViewTest
  import ElxproFeed.CommentsFixtures

  test "load main feed elements", %{conn: conn} do
    comment = comment_fixture()
    {:ok, view, _html} = live(conn, ~p"/")

    feed_id = comment.feed_id

    feed = ElxproFeed.Repo.preload(comment, :feed).feed

    assert has_element?(view, "#feed-#{feed_id}")
    assert has_element?(view, "[data-role=header][data-id=#{feed_id}]")

    assert view
           |> element("[data-role=avatar-url][data-id=#{feed_id}]")
           |> render() =~ "https://avatars.githubusercontent.com/u/12762300?v=4"

    assert has_element?(view, "[data-role=author][data-id=#{feed_id}]", feed.author)
    assert has_element?(view, "[data-role=role][data-id=#{feed_id}]", feed.role)
    assert has_element?(view, "[data-role=date][data-id=#{feed_id}]", "published at October")
    assert has_element?(view, "[data-role=date][data-id=#{feed_id}]", "published at October")
    assert has_element?(view, "[data-role=text][data-id=#{feed_id}]")
  end

  test "add a new comment", %{conn: conn} do
    comment = comment_fixture()
    {:ok, view, _html} = live(conn, ~p"/")

    feed_id = comment.feed_id

    refute view |> element("#comment-form-#{feed_id}_content") |> render() =~ "pumpkin"

    view
    |> form("#comment-form-#{feed_id}", %{comment: %{content: "pumpkin"}})
    |> render_change()

    assert view |> element("#comment-form-#{feed_id}_content") |> render() =~ "pumpkin"
  end
end
