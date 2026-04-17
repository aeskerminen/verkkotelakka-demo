defmodule VerkkotelakkaDemoWeb.Layouts do
  @moduledoc """
  This module holds layouts and related functionality
  used by your application.
  """
  use VerkkotelakkaDemoWeb, :html

  # Embed all files in layouts/* within this module.
  # The default root.html.heex file contains the HTML
  # skeleton of your application, namely HTML headers
  # and other static content.
  embed_templates "layouts/*"

  @doc """
  Renders your app layout.

  ## Examples

      <Layouts.app flash={@flash}>
        <h1>Content</h1>
      </Layouts.app>

  """
  attr :flash, :map, required: true, doc: "the map of flash messages"

  attr :current_scope, :map,
    default: nil,
    doc: "the current [scope](https://hexdocs.pm/phoenix/scopes.html)"

  slot :inner_block, required: true

  def app(assigns) do
    ~H"""
    <header class="navbar p-4 sm:px-4 lg:px-8 bg-slate-600 text-white">
      <div class="flex-1 flex justify-between">
        <h1 class="font-semibold">Verkkotelakka demo</h1>
        <div class="flex gap-4">
          <div class="flex-1 flex w-fit items-center gap-2">
            <img src={~p"/images/logo.svg"} width="36" />
            <span class="text-sm font-semibold">v{Application.spec(:phoenix, :vsn)}</span>
          </div>
        </div>
      </div>
    </header>

    <main class="flex-1 flex justify-center items-center">
      <div class="mx-auto w-2/3 space-y-4">
        {render_slot(@inner_block)}
      </div>
    </main>
    """
  end
end
