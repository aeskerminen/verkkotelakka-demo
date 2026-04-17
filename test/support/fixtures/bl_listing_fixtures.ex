defmodule VerkkotelakkaDemo.BlListingFixtures do
  alias VerkkotelakkaDemo.Repo
  alias VerkkotelakkaDemo.Schemas.BlListing

  def bl_listing_fixture(attrs \\ %{}) do
    unique_num = System.unique_integer([:positive])

    defaults = %{
      list_entry: "test-#{unique_num}.dbl.suomispam.net",
      readable_entry: "test-#{unique_num}",
      public_comment: "Test comment: test-#{unique_num}",
      notes: "Notes: test-#{unique_num}",
      created: DateTime.utc_now() |> DateTime.truncate(:second),
      modified: DateTime.utc_now() |> DateTime.truncate(:second),
      blacklist_id: "dbl.suomispam.net",
      public_review: "pending",
      review_status: "open",
      reason: "source"
    }

    attrs
    |> Enum.into(defaults)
    |> then(&struct(BlListing, &1))
    |> Repo.insert!()
  end
end
