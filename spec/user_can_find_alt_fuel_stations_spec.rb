require "rails_helper"

RSpec.feature "user can find alt fuel" do
  scenario "sees alt fuel in 6 mils" do
    VCR.use_cassette 'nrel/fuel_station' do
      visit "/"
      fill_in "zip", with: 80203
      click_on "Locate"

      expect(current_path).to eq("/search")
      expect(page).to have_content "Name: UDR"
      expect(page).to have_content "Address: 800 Acoma St Denver, CO"
      expect(page).to have_content "Fuel type: ELEC"
      expect(page).to have_content "Distance: 0.3117 miles"
      expect(page).to have_content "Access Times: 24 hours daily"
    end
  end
end
