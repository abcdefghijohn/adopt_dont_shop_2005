# User Story 11, Pet Update
#
# As a visitor
# When I visit a Pet Show page
# Then I see a link to update that Pet "Update Pet"
# When I click the link
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information
require 'rails_helper'
describe "As a visitor when I visit a Pet Show page" do
  describe "I click the link 'Update Pet' and it takes me to 'pets/:id/edit'" do
    it "I submit then the pet data is updated and I am redirected to the Pet Show Page" do
      shelter_1 = Shelter.create(name: "Denver Furry Pals",
                                 address: "123 Denver St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: 80020
                                )
      pet_1 = shelter_1.pets.create(image: "https://images.dog.ceo/breeds/poodle-toy/n02113624_1832.jpg",
                                 name: "Jim",
                                 description: "Friendly",
                                 age: 4,
                                 sex: "M",
                                 adoption_status: 'Adoptable'
                                )
      visit "/pets/#{pet_1.id}"
      click_link 'Update Pet'

      expect(page).to have_current_path("/pets/#{pet_1.id}/edit")

      fill_in 'pet[name]', with: 'Bill'
      click_on "Submit"

      expect(page).to have_current_path("/pets/#{pet_1.id}")
      expect(page).to have_content(pet_1.name)
    end
  end
end
