defmodule VerkkotelakkaDemoWeb.Router do
  use VerkkotelakkaDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {VerkkotelakkaDemoWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", VerkkotelakkaDemoWeb do
    pipe_through :browser

    live "/", Live.BlListingLive.Index, :index
  end
end
