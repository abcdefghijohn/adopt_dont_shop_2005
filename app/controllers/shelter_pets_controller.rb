class ShelterPetsController < ApplicationController
  def index
    @shelter = SHelter.find(params[:id])
  end
end
