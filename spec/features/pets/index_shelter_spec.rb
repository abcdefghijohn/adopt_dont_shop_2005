# User Story 8, Shelter Pets Index
#
# As a visitor
# When I visit '/shelters/:shelter_id/pets'
# Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's:
# - image
# - name
# - approximate age
# - sex

# User Story 9, Pet Show
#
# As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status

require 'rails_helper'

describe "As a visitor" do
  describe "through the show page" do
    it " I see each adobtable pet including description and adoption status" do
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
      visit "/shelters/#{shelter_1.id}/pets"
      click_on "Jim"

      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.age)
      expect(page).to have_content(pet_1.sex)
      expect(page).to have_content(pet_1.shelter.name)
    end
  end
end
