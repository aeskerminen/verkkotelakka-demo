defmodule VerkkotelakkaDemo.Repo do
  use Ecto.Repo,
    otp_app: :verkkotelakka_demo,
    adapter: Ecto.Adapters.SQLite3
end
