defmodule HelloPhoenix.TestView do
  use HelloPhoenix.Web, :view
  require Logger

  def test_view_function do
    Logger.info "Function from a view"
  end
end
