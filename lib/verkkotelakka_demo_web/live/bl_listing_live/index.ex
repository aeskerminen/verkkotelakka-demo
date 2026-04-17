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
        filterable: true,
        searchable: true
      },
      readable_entry: %{
        label: "Readable Entry",
        sortable: true,
        filterable: true,
      },
      public_comment: %{
        label: "Public Comment",
        sortable: true,
        filterable: true
      },
      notes: %{
        label: "Notes",
        sortable: true,
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
        sortable: true,
        filterable: true
      },
      review_status: %{
        label: "Review Status",
        sortable: true,
        filterable: true
      },
      reason: %{
        label: "Reason",
        sortable: true,
        filterable: true
      }
    ]
  end

  def filters do
    []
  end

  def table_options do
    %{
      search: %{
        enabled: true,
        debounce: 300,
        placeholder: "Search..."
      }
    }
  end
end
