require_relative '../../db/config'

class Student < ActiveRecord::Base

  def name
    "#{first_name} #{last_name}"
  end


  def age
    now = Date.today
    age = now.year - @student.birthday.year - ((now.month > @student.birthday.month || (now.month == @student.birthday.month && now.day >= @student.birthday.day)) ? 0 : 1)
  end



end

# implement your Student model here

require_relative '../../db/config'

# # implement your Student model here
# class EmailValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
#       record.errors[attribute] << (options[:message] || "is not an email")
#     end
#   end
# end

# class AgeValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     unless record.age > 5
#       record.errors[attribute] << (options[:message] || "is too young.")
#     end
#   end
# end

# class Student < ActiveRecord::Base
  validates :email, :email => true, :uniqueness => true
  validates :birthday, :age => true
  validates :phone, :phone => true

  def name
    "#{first_name} #{last_name}"
  end

  def name=(name)
    self.first_name, self.last_name = name.split(' ')
  end


end
