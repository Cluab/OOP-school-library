require './spec/spec_helper'

describe Teacher do
  before :all do
    @teacher = Teacher.new(20, 'Sport','Greg')
  end

  describe '#new' do
    it 'takes in three parameters and returns a Teacher object' do
      expect(@teacher).to be_an_instance_of Teacher
    end
  end

  it 'should return teacher name' do
    expect(@teacher.name).to eq 'Greg'
  end

  it 'should return teacher specialization ' do
    expect(@teacher.specialization).to eq 'Sport'
  end

  it 'should return teacher can use services to true' do
    expect(@teacher.can_use_services?).to eq true
  end
end
