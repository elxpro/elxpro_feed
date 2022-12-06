defmodule ElxproFeed.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElxproFeed.Feeds.Feed

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "comments" do
    field :content, :string
    field :likes, :integer, default: 0
    belongs_to :feed, Feed

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content, :likes, :feed_id])
    |> validate_required([:content, :likes])
  end
end
