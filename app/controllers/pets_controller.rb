class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @shelter = Shelter.find(params[:id])
    @pets = Pet.all
  end

  def pet_params
    params.permit(:image, :name, :description, :age, :sex, :shelter_name, :adoption_status)
  end
end
