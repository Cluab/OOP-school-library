require './spec/spec_helper'

describe Student do
  before :all do
    @student = Student.new(20, 'Greg', parent_permission: true)
  end

  describe '#new' do
    it 'takes in three parameters and returns a Student object' do
      expect(@student).to be_an_instance_of Student
    end
  end

  it 'should return student name' do
    expect(@student.name).to eq 'Greg'
  end

  it 'should return ¯(ツ)/¯ for the play_hooky method' do
    expect(@student.play_hooky).to eq '¯(ツ)/¯'
  end
end
