require './spec/spec_helper'

describe Teacher do
  before :all do
    @teacher = Teacher.new(20, 'Greg', parent_permission: true)
    
  end

  describe '#new' do
    it 'takes in three parameters and returns a Student object' do
      expect(@student).to be_an_instance_of Student
    end
    it 'takes in one parameter and returns a Classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end
  end

  it 'should return student name' do
    expect(@student.name).to eq 'Greg'
  end

  it 'should return ¯(ツ)/¯ for the play_hooky method' do
    expect(@student.play_hooky).to eq '¯(ツ)/¯'
  end

  it 'should return specific student class' do
    @classroom.add_student(@student)
    expect(@student.classroom.label).to eq 'Mathematics'
  end
end
