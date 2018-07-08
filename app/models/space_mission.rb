class SpaceMission < ApplicationRecord

  has_many :astronaut_space_missions
  has_many :astronauts, through: :astronaut_space_missions

  def self.alpha_order
    order('title ASC')
  end

end
