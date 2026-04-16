defmodule VerkkotelakkaDemoWeb.PageController do
  use VerkkotelakkaDemoWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
