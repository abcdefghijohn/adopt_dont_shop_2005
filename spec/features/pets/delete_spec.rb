# User Story 12, Pet Delete
#
# As a visitor
# When I visit a pet show page
# Then I see a link to delete the pet "Delete Pet"
# When I click the link
# Then a 'DELETE' request is sent to '/pets/:id',
# the pet is deleted,
# and I am redirected to the pet index page where I no longer see this pet
require 'rails_helper'
describe "As a visitor when I visit the pet show page" do
  describe "Then I see a link 'Delete Pet'" do
    it "When I click the link the pet is deleted and I am redirected to the pet index" do
      pet_1 = Pet.create(image: "https://images.dog.ceo/breeds/poodle-toy/n02113624_1832.jpg",
                                 name: "Jim",
                                 description: "Friendly",
                                 age: 4,
                                 sex: "M",
                                 adoption_status: 'Adoptable'
                                )
      pet_1 = Pet.create(image: "https://images.dog.ceo/breeds/poodle-toy/n02113624_1832.jpg",
                                 name: "Jim",
                                 description: "Friendly",
                                 age: 4,
                                 sex: "M",
                                 adoption_status: 'Adoptable'
                                )
      visit "/pets/#{pet_1.id}"
      click_button 'Delete Pet'
      save_and_open_page
      expect(page).to_not have_content(pet_1.name)
    end
  end
end
