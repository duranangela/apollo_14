require 'rails_helper'

describe Astronaut, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:age)}
    it {should validate_presence_of(:job)}
  end
  describe 'relationships' do
    it {should have_many(:astronaut_space_missions)}
    it {should have_many(:space_missions).through(:astronaut_space_missions)}
  end
  describe 'class methods' do
    it 'should give the average age of all astronauts' do
      Astronaut.create(name: 'Neil Armstrong', age: 36, job: 'Commander')
      Astronaut.create(name: 'Buzz Aldrin', age: 34, job: 'Pilot')
      Astronaut.create(name: 'Other Guy', age: 32, job: 'Other Astronaut')

      expect(Astronaut.average_age).to eq(34)
    end
    it 'should give the total number of days in space for astronaut' do
      astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 36, job: 'Commander')
      astronaut_1.space_missions.create(title: 'Apollo 13', trip_length: 128)
      astronaut_1.space_missions.create(title: 'Capricorn 4', trip_length: 203)

      expect(Astronaut.total_days).to eq(331)
    end
  end
end
