defmodule Dashboard do
  defstruct students: nil, courses: [], announcements: []

  def new(students) do
    %Dashboard{students: students, courses: [], announcements: []}
  end
end

