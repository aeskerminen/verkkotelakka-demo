defmodule VerkkotelakkaDemo.Repo.Migrations.CreateBlListing do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:bl_listing) do
      add :list_entry, :string
      add :readable_entry, :string
      add :public_comment, :string
      add :notes, :string
      add :created, :utc_datetime
      add :modified, :utc_datetime
      add :blacklist_id, :string
      add :public_review, :string
      add :review_status, :string
      add :reason, :string
    end
  end

  def down do
    drop_if_exists table(:bl_listing)
  end
end
