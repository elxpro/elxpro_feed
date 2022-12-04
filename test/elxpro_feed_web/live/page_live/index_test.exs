defmodule ElxproFeedWeb.PageLive.IndexTest do
  use ElxproFeedWeb.ConnCase
  import Phoenix.LiveViewTest

  test "load main elements of a feed", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/")
    assert has_element?(view, "[data-role=feeds]")

    assert has_element?(view, "#feed-123")

    assert view
           |> element("[data-role=avatar-url][data-id=123]")
           |> render() =~ "https://avatars.githubusercontent.com/u/12762300?v=4"

    open_browser(view)
  end
end
