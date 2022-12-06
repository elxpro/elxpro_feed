defmodule ElxproFeedWeb.PageLive.IndexTest do
  use ElxproFeedWeb.ConnCase
  import Phoenix.LiveViewTest
  import ElxproFeed.CommentsFixtures

  test "load main feed page", %{conn: conn} do
    comment_fixture()
    {:ok, view, _html} = live(conn, ~p"/")
    assert has_element?(view, "[data-role=feeds]")
  end
end
