defmodule Settings do
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

end
