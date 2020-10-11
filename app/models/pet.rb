class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :image, :name, :description, :age, :sex, :shelter_name, :adoption_status

end
