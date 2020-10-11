# User Story 8, Shelter Pets Index
#
# As a visitor
# When I visit '/shelters/:shelter_id/pets'
# Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's:
# - image
# - name
# - approximate age
# - sex
require 'rails_helper'

describe "As a visitor" do
  describe "when I visit '/shelters/:shelter_id/pets'" do
    it " I see each adobtable pet" do
      shelter_1 = Shelter.create(name: "Denver Furry Pals",
                                 address: "123 Denver St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: 80020
                                )
      pet_1 = shelter_1.pets.create(image: "https://images.dog.ceo/breeds/poodle-toy/n02113624_1832.jpg",
                                 name: "Jim",
                                 age: 4,
                                 sex: "M",
                                 shelter_name: "Denver Furry Pals"
                                )
      visit "/shelters/#{shelter_1.id}/pets"

      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.age)
      expect(page).to have_content(pet_1.sex)
      expect(page).to have_content(pet_1.shelter_name)
    end
  end
end
