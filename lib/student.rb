require './lib/person'
require './lib/classroom'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

# art = Classroom.new('Art')
# alex = Student.new(19, art, 'Alex')
# art.add_student(alex)
# alex.classroom
# alex.classroom.label
# alex.classroom.students
# alex.classroom.students[0].name
