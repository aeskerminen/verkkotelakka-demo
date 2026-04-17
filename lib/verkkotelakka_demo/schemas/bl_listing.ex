defmodule VerkkotelakkaDemo.Schemas.BlListing do
  use Ecto.Schema

  schema "bl_listing" do
    field :list_entry, :string
    field :readable_entry, :string
    field :public_comment, :string
    field :notes, :string
    field :created, :utc_datetime
    field :modified, :utc_datetime
    field :blacklist_id, :string
    field :public_review, :string
    field :review_status, :string
    field :reason, :string
  end
end
