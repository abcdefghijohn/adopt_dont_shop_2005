class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @shelter = Shelter.find(params[:id])
    @pets = Pet.all
  end
end
