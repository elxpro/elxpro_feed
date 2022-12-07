defmodule ElxproFeedWeb.PageLive.Feed.Comment do
  use ElxproFeedWeb, :live_component
  import ElxproFeedWeb.PageLive.Shared.Components
  alias ElxproFeed.Comments
  alias ElxproFeedWeb.PageLive.Feed

  def handle_event("delete", _, socket) do
    comment = socket.assigns.comment
    Comments.delete_comment(comment)
    send_update(Feed, id: comment.feed_id, delete_comment: comment)
    {:noreply, socket}
  end

  def handle_event("like", _, socket) do
    comment = socket.assigns.comment
    likes = comment.likes + 1
    {:ok, comment} = Comments.update_comment(comment, %{likes: likes})
    {:noreply, update(socket, :comment, &%{&1 | likes: comment.likes})}
  end
end
