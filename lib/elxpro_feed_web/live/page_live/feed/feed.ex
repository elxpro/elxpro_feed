defmodule ElxproFeedWeb.PageLive.Feed do
  use ElxproFeedWeb, :live_component
  import ElxproFeed.Shared.DateUtils
  import Phoenix.HTML.Form
  import ElxproFeedWeb.PageLive.Shared.Components
  alias __MODULE__.Comment
  alias ElxproFeed.Comments
  alias ElxproFeed.Comments.Comment, as: CommentSchema

  def update(%{delete_comment: comment}, socket) do
    feed = socket.assigns.feed
    comments = Enum.filter(feed.comments, &(&1.id != comment.id))
    feed = Map.put(feed, :comments, comments)
    {:ok, assign(socket, :feed, feed)}
  end

  def update(%{new_comment: new_comment}, socket) do
    feed = socket.assigns.feed
    comments = feed.comments ++ [new_comment]
    feed = Map.put(feed, :comments, comments)
    {:ok, assign(socket, :feed, feed)}
  end

  def update(assigns, socket) do
    socket =
      socket
      |> assign(assigns)
      |> assign(comment_changeset: Comments.change_comment(%CommentSchema{}))

    {:ok, socket}
  end

  def handle_event("validate", %{"comment" => comment_params}, socket) do
    changeset = Comments.change_comment(%CommentSchema{}, comment_params)
    {:noreply, assign(socket, comment_changeset: changeset)}
  end

  def handle_event("add_comment", %{"comment" => comment_params}, socket) do
    feed_id = socket.assigns.feed.id
    comment_params = Map.put(comment_params, "feed_id", feed_id)

    case Comments.create_comment(comment_params) do
      {:ok, comment} ->
        changeset = Comments.change_comment(%CommentSchema{})
        send_update(__MODULE__, id: feed_id, new_comment: comment)
        {:noreply, assign(socket, comment_changeset: changeset)}

      {:error, _} ->
        {:noreply, socket}
    end
  end

  def post_comment_form(assigns) do
    ~H"""
    <.form
      :let={f}
      for={@changeset}
      phx-change="validate"
      phx-submit="add_comment"
      phx-target={@target}
      id={"comment-form-" <> @id}
      class="w-full mt-6 pt-6 border-t border-gray-600 leading-relaxed flex flex-col group"
    >
      <%= label(f, :content, "Post your comment", class: "text-gray-100") %>
      <%= textarea(f, :content,
        placeholder: "Post your coment",
        class: "bg-gray-900 border-0 resize-none h-24 p-4 rounded-sm text-gray-100 mt-4"
      ) %>

      <footer class="max-h-0 invisible group-focus-within:visible group-focus-within:max-h-[none]">
        <%= submit("Make a Comment",
          class:
            "px-4 py-6 mt-4 rounded-lg bg-blue-900 [&:not(:disabled)]:hover:bg-blue-800 text-white font-bold cursor-pointer transition disabled:opacity-70 disabled:cursor-not-allowed",
          disabled: !@changeset.valid?,
          "data-role": "add-comment",
          "data-id": @id
        ) %>
      </footer>
    </.form>
    """
  end
end
