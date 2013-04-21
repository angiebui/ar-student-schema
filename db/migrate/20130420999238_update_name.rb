require_relative '../config'
require_relative '../../app/models/student'


class UpdateName < ActiveRecord::Migration
  def change
    add_column :students, :name, :string
    add_column :students, :address, :string
    Student.reset_column_information

    Student.all.each do |student|
      student.assign_attributes(:name => student.name)
      student.save
    end
  end
end