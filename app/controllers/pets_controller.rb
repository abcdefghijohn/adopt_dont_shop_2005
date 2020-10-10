class PetsController < ApplicationRecord
  def index
    @pets = Pets.all
  end
end
