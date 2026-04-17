defmodule VerkkotelakkaDemoWeb.Live.BlListingLive.Index do
  use VerkkotelakkaDemoWeb, :live_view
  use LiveTable.LiveResource, schema: VerkkotelakkaDemo.Schemas.BlListing

  def fields do
    [
      id: %{
        label: "ID",
        sortable: true,
        filterable: true
      },
      list_entry: %{
        label: "List Entry",
        sortable: true,
        filterable: true
      },
      readable_entry: %{
        label: "Readable Entry",
        sortable: true,
        filterable: true
      },
      public_comment: %{
        label: "Public Comment",
        sortable: false,
        filterable: true
      },
      notes: %{
        label: "Comment",
        sortable: false,
        filterable: true
      },
      created: %{
        label: "Created",
        sortable: true,
        filterable: true
      },
      modified: %{
        label: "Modified",
        sortable: true,
        filterable: true
      },
      blacklist_id: %{
        label: "Blacklist ID",
        sortable: true,
        filterable: true
      },
      public_review: %{
        label: "Public Review",
        sortable: false,
        filterable: true
      },
      review_status: %{
        label: "Review Status",
        sortable: true,
        filterable: true
      },
      reason: %{
        label: "Reason",
        sortable: false,
        filterable: true
      }
    ]
  end

  def filters do
    [
    ]
  end
end
