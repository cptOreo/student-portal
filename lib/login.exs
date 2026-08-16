defmodule Login do 
  @users %{
    "rav" => "password",
    "dhav" => "12345678"
  }

  def authenticate(username, password) do
    case Map.get(@users, username) do
      nil -> {:error, "User not found"}
      ^password -> {:ok, "Login successful"}
      _ -> {:error, "Invalid password"}
    end
  end
end

IO.inspect(Login.authenticate("rav", "password"))

