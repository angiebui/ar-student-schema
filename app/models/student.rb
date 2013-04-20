require_relative '../../db/config'

class AgeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless record.age > 5
      record.errors[attribute] << (options[:message] || "isn't over 5 years old.")
    end
  end
end

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless record.phone.scan(/\d/).count >= 10
      record.errors[attribute] << (options[:message] || "is not a valid phone")
    end
  end
end

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless record.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Student < ActiveRecord::Base
  has_many :teachers, :through => :students_teachers
  has many :student_teachers

  validates :email, :uniqueness => true, :email => true
  validates :phone, :phone => true
  validates :birthday, :age => true

  def name
    "#{first_name} #{last_name}"
  end

  def age
    now = Date.today
    age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end
end



