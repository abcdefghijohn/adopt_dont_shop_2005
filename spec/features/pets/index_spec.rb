# User Story 7, Pet Index
#
# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located
require 'rails_helper'

describe "As a visitor when I visit /pets" do
  describe "Then I see each Pet in the system" do
    it "including image, name, age, sex, name of shelter" do
      shelter_4 = Shelter.create(
                                 name: "Golden Furry Pals",
                                 address: "123 Golden",
                                 city: "Golden",
                                 state: "CO",
                                 zip: 80821
                                )
      pet_1 = shelter_4.pets.create!(
                          image: "https://images.dog.ceo/breeds/poodle-toy/n02113624_1832.jpg",
                          name: "Bob",
                          age: 1,
                          description: "Nice",
                          sex: "M",
                          adoption_status: 'Adoptable',
                          shelter_id: shelter_4.id
                        )

      visit '/pets'
      expect(page).to have_content("All the Pets!")
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.age)
      expect(page).to have_content(pet_1.sex)
      expect(page).to have_content(shelter_4.name)
    end
  end
end
