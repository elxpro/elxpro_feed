defmodule ElxproFeedWeb.PageLive.FeedTest do
  use ElxproFeedWeb.ConnCase
  import Phoenix.LiveViewTest
  import ElxproFeed.CommentsFixtures

  alias ElxproFeed.Feeds

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
    assert has_element?(view, "[data-role=date][data-id=#{feed_id}]", "published at 0 hours")
    assert has_element?(view, "[data-role=text][data-id=#{feed_id}]")
  end

  test "validate comment", %{conn: conn} do
    comment = comment_fixture()
    {:ok, view, _html} = live(conn, ~p"/")

    feed_id = comment.feed_id

    refute view |> element("#comment-form-#{feed_id}_content") |> render() =~ "pumpkin"

    assert view |> element("[data-role=add-comment][data-id=#{feed_id}]") |> render() =~
             "disabled=\"disabled\""

    view
    |> form("#comment-form-#{feed_id}", %{comment: %{content: "pumpkin"}})
    |> render_change()

    assert view |> element("#comment-form-#{feed_id}_content") |> render() =~ "pumpkin"

    refute view |> element("[data-role=add-comment][data-id=#{feed_id}]") |> render() =~
             "disabled=\"disabled\""
  end

  test "add comment", %{conn: conn} do
    comment = comment_fixture()
    {:ok, view, _html} = live(conn, ~p"/")

    feed_id = comment.feed_id

    view
    |> form("#comment-form-#{feed_id}", %{comment: %{content: "pumpkin"}})
    |> render_submit()

    refute view |> element("#comment-form-#{feed_id}_content") |> render() =~ "pumpkin"

    comments = Feeds.get_comments(feed_id)

    assert comments |> Enum.count() == 2

    Enum.each(comments, fn comment ->
      assert has_element?(view, "#comment-#{comment.id}")
    end)
  end
end
