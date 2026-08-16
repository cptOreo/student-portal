defmodule StudentPortal do
  defstruct name: nil, id: nil, grades: []  

  def new_student(name, id) do
    %StudentPortal{name: name, id: id, grades: []}
  end

  def add_grade(%StudentPortal{} = student, grade) do
    %StudentPortal{student | grades: [grade | student.grades]}
  end

  def average_grade(student) do
    case student.grades do
      [] -> 0.0
      grades -> Enum.sum(grades) / length(grades)
    end
  end
  
  def remove_last_grade(student) do
    case student.grades do
      [] -> student
      [_head | tail] -> %{student | grades: tail}
    end
  end

  def letter_grade(student) do
    avg = average_grade(student)

    cond do
      avg >= 90 -> "A"
      avg >= 80 -> "B"
      avg >= 70 -> "C"
      avg >= 60 -> "D"
      true -> "F"
    end
  end

  def add_grades(student, grades) when grades >= 0 and grades <= 100 do
    %{student | grades: [grades | student.grades]}
  end
end

student = StudentPortal.new_student("Ravi", 4004)
student = StudentPortal.add_grade(student, 85)
student = StudentPortal.add_grade(student, 92)

IO.puts("Student Name: #{student.name}")
IO.puts("Average grade: #{StudentPortal.average_grade(student)}")



