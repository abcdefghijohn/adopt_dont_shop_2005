# User Story 2, Shelter Index
# As a visitor
# When I visit '/shelters'
# Then I see the name of each shelter in the system

require "rails_helper"

describe "As a visitor" do
  describe "when I visit /shelters" do
    it "I see the name of each shelter in the system" do
      shelter_1 = Shelter.create(name:"Denver Furry Pals", address:"123 Denver", city:"Denver", state:"CO", zip:80206)
      shelter_2 = Shelter.create(name:"Boulder Furry Pals", address:"123 Boulder", city:"Boulder", state:"CO", zip:80005)
      shelter_3 = Shelter.create(name:"Broomfield Furry Pals", address:"123 Broomfield", city:"Broomfield", state:"CO", zip:80260)
      visit '/shelters'

      expect(page).to have_content("All the Shelters!")
      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_2.name)
      expect(page).to have_content(shelter_3.name)
    end
  end
end
