# User Story 4, Shelter Creation
#
# As a visitor
# When I visit the Shelter Index page
# Then I see a link to create a new Shelter, "New Shelter"
# When I click this link
# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.

require "rails_helper"

describe "As a visitor, when I click the 'New Shelter' link in the Shelter Index page" do
  describe "I see a form to create a new shelter" do
    it "I input all the necessary fields of the form and it creates a new shelter when I hit 'submit'" do

      shelter_4 = Shelter.create(
                                 name: "Golden Furry Pals",
                                 address: "123 Golden",
                                 city: "Golden",
                                 state: "CO",
                                 zip: 80821
                                )
      visit "/shelters/#{shelter_4.id}"
      expect(page).to have_content("#{shelter_4.name}")
      expect(page).to have_content("#{shelter_4.address}")
      expect(page).to have_content("#{shelter_4.city}")
      expect(page).to have_content("#{shelter_4.state}")
      expect(page).to have_content("#{shelter_4.zip}")
    end
  end
end
