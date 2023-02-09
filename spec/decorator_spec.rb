require './spec/spec_helper'

describe Person do
  before :all do
    @person = Person.new(14, 'gregmantins', parent_permission: false)
    @capitalize_decorator = CapitalizeDecorator.new(@person)
    @trimmer_decorator = TrimmerDecorator.new(@person)
    @nameable = Nameable.new
  end

  describe '#new' do
    it 'takes in three parameters and returns a Person object' do
      expect(@person).to be_an_instance_of Person
    end
  end

  it 'should capitalize the person name' do
    expect(@capitalize_decorator.correct_name).to eq 'GREGMANTINS'
  end
  it 'should trim the person name to ten characters' do
    expect(@trimmer_decorator.correct_name).to eq 'gregmantin'
  end

  it 'should return NotImplementedError' do
    expect { @nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
