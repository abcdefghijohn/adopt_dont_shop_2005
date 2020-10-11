# User Story 10, Shelter Pet Creation
#
# As a visitor
# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter "Create Pet"
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# And I click the button "Create Pet"
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed
require 'rails_helper'
describe "As a visitor when I visit the Shelter Pets Index page" do
  describe "I see a link for that shelter 'Create Pet'" do
    it "I fill out the form and it creates a new pet that is adoptable and I am redirected back to Shelter Pets Index" do
      shelter_1 = Shelter.create(name: "Denver Furry Pals",
                                 address: "123 Denver St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: 80020
                                )
      visit "/shelters/#{shelter_1.id}/pets"
      click_on "Create Pet"

      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

      fill_in 'Name', with: 'Sam'
      fill_in 'Description', with: 'Friendly'
      fill_in 'Age', with: '3'
      fill_in 'Sex', with: 'F'
      click_on "Submit"

      expect(page).to have_content('Sam')
      expect(page).to have_content('Friendly')
      expect(page).to have_content(3)
      expect(page).to have_content('F')
      expect(page).to have_content('Adoptable')

    end
  end
end
