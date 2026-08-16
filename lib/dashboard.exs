defmodule Dashboard do

  @moduledoc """
  A simple dashboard for students to manage their courses and announcements.
  """

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

  def post_announcement(%Dashboard{} = dashboard, message) do
    %Dashboard{dashboard | announcements: [message | dashboard.announcements]}
  end

  def course_count(%Dashboard{} = dashboard) do
    length(dashboard.courses)
  end

  def course_names(dashboard) do
    dashboard.courses
  end
  
  def upcoming_courses(dashboard, limit) do
    Enum.take(dashboard.courses, limit)
  end

end

dash = Dashboard.new("Rav")
dash = Dashboard.add_course(dash, "Design Thinking")
dash = Dashboard.add_course(dash, "Data Structures")
dash = Dashboard.post_announcement(dash, "Welcome to the new semester!")

IO.puts ("Courses: #{Enum.join(dash.courses, ", ")}")
IO.puts ("Announcements: #{Enum.join(dash.announcements, ", ")}")

