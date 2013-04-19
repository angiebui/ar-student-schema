require 'rspec'
require 'date'
require_relative '../app/models/teacher'

describe Teacher, "email validation" do

  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:students).should be_true
    Teacher.delete_all
  end

  before(:each) do

    it "shouldn't allow two teachers with the same email" do
      another_teacher = Teacher.create!(
        :name => teacher.name,
        :email => @teacher.email,
        :phone => @teacher.phone
        )
      @teacher.should_not be_valid
    end
  end
end
