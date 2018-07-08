require 'rails_helper'

describe SpaceMission, type: :model do
  describe 'relationships' do
    it {should have_many(:astronaut_space_missions)}
    it {should have_many(:astronauts).through(:astronaut_space_missions)}
  end
  describe 'class methods' do
    it 'should list missions by title in alphabetical order' do
      mission1 = SpaceMission.create(title: 'Capricorn 4', trip_length: 203)
      mission2 = SpaceMission.create(title: 'Apollo 13', trip_length: 128)

      result = [mission2, mission1]

      expect(SpaceMission.alpha_order).to eq(result)
    end
  end

end
