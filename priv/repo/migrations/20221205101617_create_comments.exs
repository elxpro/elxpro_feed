defmodule ElxproFeed.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :content, :text
      add :likes, :integer
      add :feed_id, references(:feeds, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:comments, [:feed_id])
  end
end
