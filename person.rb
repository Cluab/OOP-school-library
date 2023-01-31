class Person < Nameable

  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class BaseDecorator < Nameable

  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @namealbe
  end
end
