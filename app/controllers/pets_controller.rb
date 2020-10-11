class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @shelter = Shelter.find(params[:id])
    @pets = Pet.all
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    @shelter = Shelter.find(params[:id])
    @new_pet = shelter.pets.new(pet_params)
    
    new_pet.save
    redirect_to('shelters/#{@shelter.id}/pets')
  end

  def pet_params
    params.permit(:image, :name, :description, :age, :sex, :shelter_name, :adoption_status)
  end
end
