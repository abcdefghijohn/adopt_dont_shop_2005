# User Story 5, Shelter Update
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info

require 'rails_helper'

describe "As a visitor I see the 'Update Shelter' link in the shelter show page" do
  describe "'Update Shelter' takes me to '/shelters/:id/edit' to a form to edit the shelter" do
    it "When I fill out the form and click submit the shelter's info is updated and takes me to the Shelter's Show page" do
    shelter_4 = Shelter.create(
                               name: "Golden Furry Pals",
                               address: "123 Golden",
                               city: "Golden",
                               state: "CO",
                               zip: 80821
                              )

    visit "/shelters/#{shelter_4.id}"
    click_on 'Update Shelter'
    fill_in 'shelter[address]', with: '123 Golden St'
    click_on 'Submit'
    expect(page).to have_content(shelter_4.address)

  end
  end
end
