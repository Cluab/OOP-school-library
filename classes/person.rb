class Person
    attr_accessor :name
    attr_accessor :age
    attr_reader :id
    def initialize (name = "Unknown", age, parents_permission = true)
    @id = id
    @name = name
    @age = age
    end
    private
    def is_of_age?
        return true if @age >= 18
        false
       end
       def can_use_services?
           return true if this.is_of_age? || parents_permission = true
           false
       end
end