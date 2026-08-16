defmodule Settings do

  @moduledoc """
  manages user settings for an application, including notifications, theme, and language preferences.
  """

  defstruct notifications: true, theme: "light", language: "en"

  def new do
    %Settings{}
  end

  def toggle_notifications(settings) do
    %{settings | notifications: !settings.notifications}
  end

  def set_theme(settings, theme) when theme in ["light", "dark"] do
    %{settings | theme: theme}
  end
  
  @supported_languages ["en", "es", "fr", "de"]

  def set_language(settings, lang) do
    if lang in @supported_languages do
      {:ok, %{settings | language: lang}}
    else
      {:error, "Unsupported language"}
    end
  end

  def reset_to_defaults(_settings) do
    %Settings{}
  end

end

settings = Settings.new()
settings = Settings.toggle_notifications(settings)
settings = Settings.set_theme(settings, "dark")

case Settings.set_language(settings, "es") do
  {:ok, updated_settings} ->
    IO.puts("Theme: #{updated_settings.theme}, Notifications: #{updated_settings.notifications}, Language: #{updated_settings.language}")
  {:error, reason} ->
    IO.puts("Error: #{reason}")


end

