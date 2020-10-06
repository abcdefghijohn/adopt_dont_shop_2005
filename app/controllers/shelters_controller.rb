class SheltersController < ApplicationController

  def index
    @shelters = ['Denver Furry Pals', 'Boulder Furry Pals', 'Broomfield Furry Pals']
  end

  def id
    @shelter = Shelter.find_by(id: params[:id])
  end
end
