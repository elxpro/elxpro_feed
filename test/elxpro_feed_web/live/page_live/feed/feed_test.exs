defmodule ElxproFeedWeb.PageLive.FeedTest do
  use ElxproFeedWeb.ConnCase
  import Phoenix.LiveViewTest

  test "load main feed elements", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/")

    feed_id = "123"

    assert has_element?(view, "#feed-#{feed_id}")
    assert has_element?(view, "[data-role=header][data-id=#{feed_id}]")

    assert view
           |> element("[data-role=avatar-url][data-id=#{feed_id}]")
           |> render() =~ "https://avatars.githubusercontent.com/u/12762300?v=4"

    assert has_element?(view, "[data-role=author][data-id=#{feed_id}]", "Gustavo Oliveira")
    assert has_element?(view, "[data-role=role][data-id=#{feed_id}]", "Elixir Developer")
    assert has_element?(view, "[data-role=date][data-id=#{feed_id}]", "published at October")
    assert has_element?(view, "[data-role=date][data-id=#{feed_id}]", "published at October")
    assert has_element?(view, "[data-role=text][data-id=#{feed_id}]")
  end
end
