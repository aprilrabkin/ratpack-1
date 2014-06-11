class Person < ActiveRecord::Base

  # def initialize(person_hash)
  #   @name = person_hash[:name]
  #   @compliment = person_hash[:compliment]
  # end

  def give_compliment
    "#{name} #{compliment}"
  end

end