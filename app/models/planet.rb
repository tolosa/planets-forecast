class Planet < ApplicationRecord

  include OrbitalCalculations

  attr_readonly :name, :distance_to_sun, :angular_velocity

end
