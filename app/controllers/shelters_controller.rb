class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def new
  end

  def create
    shelter = Shelter.new({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]
      })
      shelter.save

      redirect_to '/shelters'
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def edit
    # require "pry"; binding.pry
    @shelter = Shelter.find(params[:id])
    # require "pry"; binding.pry
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update({
                    name: params[:shelter][:name],
                    address: params[:shelter][:address],
                    city: params[:shelter][:city],
                    state: params[:shelter][:state],
                    zip: params[:shelter][:zip]
                  })
    shelter.save
    redirect_to "/shelters/#{shelter.id}"
  end

end
