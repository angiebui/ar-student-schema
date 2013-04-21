require_relative '../../db/config'

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




class Teacher < ActiveRecord::Base
  has_many :students, :through => :student_teachers
  has_many :student_teachers

  validates :email, :uniqueness => true, :email => true
  validates :phone, :phone => true

  def name
    "#{first_name} #{last_name}"
  end
end

