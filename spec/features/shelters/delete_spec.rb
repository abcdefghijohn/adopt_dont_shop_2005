# User Story 6, Shelter Delete
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter

require 'rails_helper'

describe "As a visitor when I vist the shelter show page" do
  describe "I see a link to delete the shelter, 'Delete Shelter'" do
    it "I click the 'Delete Shelter', the shelter is deleted and I am redirected to index" do
    shelter_1 = Shelter.create(
                               name: "Boulder Furry Pals",
                               address: "123 Boulder",
                               city: "Boulder",
                               state: "CO",
                               zip: 80005
                              )

    visit "/shelters/#{shelter_1.id}"
    click_on 'Delete Shelter'

    expect(page).to have_current_path('/shelters')
    save_and_open_page
    expect(page).to_not have_content(shelter_1.name)
    end
  end
end
