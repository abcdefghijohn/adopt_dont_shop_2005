# User Story 3, Shelter Show
#
# As a visitor
# When I visit '/shelters/:id'
# Then I see the shelter with that id including the shelter's:
# - name
# - address
# - city
# - state
# - zip

require "rails_helper"

describe "As a visitor" do
  describe "when I visit /shelters/:id" do
    it "I see the shelter of that id and all the necessary information" do
      shelter_1 = Shelter.create(name:"Denver Furry Pals", address:"123 Denver", city:"Denver", state:"CO", zip:80206)

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_1.address)
      expect(page).to have_content(shelter_1.city)
      expect(page).to have_content(shelter_1.state)
      expect(page).to have_content(shelter_1.zip)
    end
  end
end
