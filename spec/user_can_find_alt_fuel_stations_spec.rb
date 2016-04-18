require "rails_helper"

RSpec.feature "user can find alt fuel" do
  scenario "sees alt fuel in 6 mils" do
    VCR.use_cassette 'nrel/fuel_station' do
      visit "/"
      fill_in "zip", with: 80203
      click_on "Locate"

      expect(current_path).to eq("/search")

      expect(page).to have_content "Name: First one"
      expect(page).to have_content "Address: Somewhere lane"
      expect(page).to have_content "Fuel type: Grease"
      expect(page).to have_content "Distance: 1 mile"
      expect(page).to have_content "Access Times: 10pm"
    end
  end
end
