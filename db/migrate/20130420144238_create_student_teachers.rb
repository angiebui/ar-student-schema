require_relative '../config'

class StudentTeacherTables < ActiveRecord::Migration
  def change
    create_table :student_teachers do |t|
      t.integer :teacher_id
      t.integer :student_id
    end
  end
end