class Person < ActiveRecord::Base

  def give_compliment
    "#{name} #{compliment}"
  end

end