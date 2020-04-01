defmodule RumblWeb.UserController do

  use RumblWeb, :controller

  alias Rumbl.Accounts

  import Rumbl.HTTP.Client

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user(id)
    render(conn, "show.html", user: user)
  end

  def users_api_test(conn, _params) do
    request = build_conn("http://phoenixlb-2060721201.us-west-2.elb.amazonaws.com/api/v1/user/1", :get)
    |> add_request_header("content-type", "application/json")
    |> make_request

    case request do
      {:ok, %{status_code: 200, body: body}} ->
        body = Poison.decode!(body)
        pretty_json(conn, body)
      _ ->
        conn
        |> put_flash(:info, "El servicio no esta disponible")
        |> render "/"
    end
  end
 
  defp pretty_json(conn, data) do
    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json; charset=utf-8")
    |> Plug.Conn.send_resp(200, Poison.encode!(data, pretty: true))
  end

end