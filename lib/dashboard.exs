defmodule Dashboard do
  defstruct students: nil, courses: [], announcements: []

  def new(students) do
    %Dashboard{students: students, courses: [], announcements: []}
  end

  def add_course(%Dashboard{} = dashboard, course) do
    %Dashboard{dashboard | courses: [course | dashboard.courses]}
  end

  def remove_course(%Dashboard{} = dashboard, course) do
    %Dashboard{dashboard | courses: List.delete(dashboard.courses, course)}
  end

end

