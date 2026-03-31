defmodule TodoLiveWeb.PageController do
  use TodoLiveWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
