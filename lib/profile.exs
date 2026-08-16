defmodule Profile do
  defstruct name: nil, email: nil, bio: "", year: nil

  def new(name, email, year) do
    %Profile{name: name, email: email, year: year}
  end

  def update_bio(%Profile{} = profile, new_bio) do
    %Profile{profile | bio: new_bio}
  end

  def update_email(%Profile{} = profile, new_email) do
    %Profile{profile | email: new_email}
  end
  
  def valid_email?(email) do
    String.contains?(email, "@") and String.contains?(email, ".")
  end
end

profile = Profile.new("Rav", "rav@example.com", 2024)
profile = Profile.update_bio(profile, "PDM Student")

IO.puts("Name: #{profile.name}")
IO.puts("Email: #{profile.email}")
IO.puts("Email valid? #{Profile.valid_email?(profile.email)}")
