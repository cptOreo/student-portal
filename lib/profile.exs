defmodule Profile do
  defstruct name: nil, email: nil, bio: "", year: nil

  def new(name, email, year) do
    %Profile{name: name, email: email, year: year}
  end
end

