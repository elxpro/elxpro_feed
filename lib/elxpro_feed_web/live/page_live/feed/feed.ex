defmodule ElxproFeedWeb.PageLive.Feed do
  use ElxproFeedWeb, :live_component

  def post_comment_form(assigns) do
    ~H"""
    <form
      action="#"
      class="w-full mt-6 pt-6 border-t border-neutral-600 leading-relaxed flex flex-col group"
    >
      <label for="content" class="text-neutral-100">Post your comment</label>
      <textarea
        name="content"
        id="content"
        cols="30"
        rows="10"
        placeholder="Post your coment"
        class="bg-neutral-900 border-0 resize-none h-24 p-4 rounded-sm text-neutral-100 mt-4"
      >
      </textarea>

      <footer class="max-h-0 invisible group-focus-within:visible group-focus-within:max-h-[none]">
        <button
          type="submit"
          class="px-4 py-6 mt-4 rounded-lg bg-cyan-900 not:disabled:hover:bg-cyan-800 text-white font-bold cursor-pointer transition disabled:opacity-70 disabled:cursor-not-allowed"
        >
          Make a Comment
        </button>
      </footer>
    </form>
    """
  end
end
