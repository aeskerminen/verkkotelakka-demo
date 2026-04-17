defmodule VerkkotelakkaDemoWeb.Live.BlListingLive.IndexTest do
  use VerkkotelakkaDemoWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import VerkkotelakkaDemo.BlListingFixtures

  describe "index" do
    test "renders table and controls", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/")

      assert has_element?(view, "#resources-stream")
      assert has_element?(view, "#table-search")
      assert has_element?(view, "#per-page-select")
      assert has_element?(view, "[phx-click='sort'][phx-value-sort]")
    end

    test "filters rows using search", %{conn: conn} do
      matching = bl_listing_fixture(%{list_entry: "match-token-001", readable_entry: "Read match"})
      non_matching = bl_listing_fixture(%{list_entry: "other-token-002", readable_entry: "Read other"})

      assert matching.list_entry != non_matching.list_entry

      {:ok, view, _html} = live(conn, ~p"/")
      assert has_element?(view, "#resources-stream tr", matching.list_entry)
      assert has_element?(view, "#resources-stream tr", non_matching.list_entry)

      view
      |> form("form[phx-change='sort']", %{"search" => matching.list_entry})
      |> render_change()

      assert has_element?(view, "#table-search[value='#{matching.list_entry}']")
      assert has_element?(view, "#resources-stream tr", matching.list_entry)
      refute has_element?(view, "#resources-stream tr", non_matching.list_entry)
    end

    test "shows default empty result if query matches nothing", %{conn: conn} do
      matching = bl_listing_fixture(%{list_entry: "visible-token-001"})
      non_matching_list_entry = "invisible-token-002"

      assert non_matching_list_entry != matching.list_entry

      {:ok, view, _html} = live(conn, ~p"/")
      assert has_element?(view, "#resources-stream tr", matching.list_entry)

      view
      |> form("form[phx-change='sort']", %{"search" => non_matching_list_entry})
      |> render_change()

      assert has_element?(view, "#table-search[value='#{non_matching_list_entry}']")
      assert has_element?(view, "#empty-placeholder")
      refute has_element?(view, "#resources-stream tr", matching.list_entry)
    end
  end
end
