defmodule ElxproFeed.Repo.Migrations.AddFeeds do
  use Ecto.Migration

  def change do
    create table(:feeds, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :content, :text
      add :author, :string
      add :avatar_url, :string
      add :role, :string

      timestamps()
    end
  end
end
