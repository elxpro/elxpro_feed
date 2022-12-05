defmodule ElxproFeed.Feeds.Feed do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElxproFeed.Comments.Comment

  @fields ~w/content author avatar_url role/a
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "feeds" do
    field :content, :string
    field :author, :string
    field :avatar_url, :string
    field :role, :string
    has_many :comments, Comment
    timestamps()
  end

  def changeset(feed, attrs) do
    feed
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
