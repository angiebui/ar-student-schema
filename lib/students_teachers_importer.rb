require '../app/models/student'
require '../app/models/teacher'
require '../app/models/student_teacher'

def seed_relationships
  all_teachers = Teacher.all
  all_students = Student.all

  all_students.each do |student|
    all_teachers.sample.students << student
  end
end

seed_relationships



