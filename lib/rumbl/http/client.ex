defmodule Rumbl.HTTP.Client do
  defstruct method: :get, uri: "", headers: [], params: [], body: ""
  require Logger

  def build_conn(path, method) do
    %Rumbl.HTTP.Client{method: method, uri: path}
  end

  def add_request_header(conn, key, value) do
    %{conn | headers: [{key, value}|conn.headers]}
  end

  def make_request(%{method: method, uri: uri, headers: headers, params: params, body: body}) do
    # timeout =
    #   Application.get_env(:Rumbl, :http_client_timeout)
    #   |> String.to_integer
    # HTTPoison.request(method, uri, body, headers, params: params, recv_timeout: timeout)
    HTTPoison.request(method, uri, body, headers, params: params)
  end
end