class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find_by(id: params[:id])
  end

  def new
  end

  def create
  end 
end
