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

  def validate_credentials(username, password) do
    cond do
      String.length(username) < 3 -> {:error, "Username must be at least 3 characters long"}
      String.length(password) < 8 -> {:error, "Password must be at least 8 characters long"}
      true -> :ok
    end
  end
  
  def track_attempt(attempts_map, username) do
    Map.update(attempts_map, username, 1, &(&1 + 1))
  end

  def locked_out?(attempts_map, username, max_attempts \\ 3) do
    Map.get(attempts_map, username, 0) >= max_attempts
  end
end


  IO.inspect(Login.authenticate("rav", "password"))
  IO.inspect(Login.authenticate("dhav", "wrongpassword"))


