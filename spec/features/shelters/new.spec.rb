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

describe "As a visitor" do
  describe "when I visit the Shelter Index page" do
    it "I see a link 'New Shelter' that takes me to fill out a form which sends a POST request and redirects me to the Shelter Index page where I see the new Shelter"
    
  end

end
