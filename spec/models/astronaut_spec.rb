require 'rails_helper'

describe Astronaut, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:age)}
    it {should validate_presence_of(:job)}
  end
  describe 'class methods' do
    it 'should give the average age of all astronauts' do
      Astronaut.create(name: 'Neil Armstrong', age: 36, job: 'Commander')
      Astronaut.create(name: 'Buzz Aldrin', age: 34, job: 'Pilot')
      Astronaut.create(name: 'Other Guy', age: 32, job: 'Other Astronaut')

      expect(Astronaut.average_age).to eq(34)
    end
  end
end
