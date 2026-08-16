defmodule Settings do
  defstruct notifications: true, theme: "light", language: "en"

  def new do
    %Settings{}
  end
end

