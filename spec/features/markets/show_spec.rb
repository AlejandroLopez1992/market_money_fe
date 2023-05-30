require 'rails_helper'
RSpec.describe "markets#show", :vcr do
  describe "Page display" do
    it "shows market name, address, and list of vendors", :vcr do
      market = MarketFacade.new(325686).market

      visit market_path(market.id)

      expect(page).to have_content("Greenwich Farmers Market")
      expect(page).to have_content("Town Hall parking lot, Field Point Road, Greenwich, Connecticut, 06830")
      expect(page).to have_content("Vendors at our market:")

      expect(page).to have_content("Bee-licious Honey")
      expect(page).to have_content("Flower Power")
      expect(page).to have_content("Siskiyou Sweets")
      expect(page).to have_content("Root Awakening")
      expect(page).to have_content("The Meatball Mania")
      expect(page).to have_content("It's All Gravy")
      expect(page).to have_content("Spice Girlz")
      expect(page).to have_content("Exotic Eats")
      expect(page).to have_content("The Corny Copia")
      expect(page).to have_content("Pupperoni Pizza")
    end

    it "each vendor's name is a link to vendor show page", :vcr do
      market = MarketFacade.new(325686).market

      visit market_path(market.id)

      within("#vendors") do
        expect(page).to have_link("Bee-licious Honey")
        expect(page).to have_link("Flower Power")
        expect(page).to have_link("Siskiyou Sweets")
        expect(page).to have_link("Root Awakening")
        expect(page).to have_link("The Meatball Mania")
        expect(page).to have_link("It's All Gravy")
        expect(page).to have_link("Spice Girlz")
        expect(page).to have_link("Exotic Eats")
        expect(page).to have_link("The Corny Copia")
        expect(page).to have_link("Pupperoni Pizza")
      end

      within("#vendors") do
      click_link("Bee-licious Honey")
      expect(current_path).to eq(vendor_path(54967))
    end
    end
  end
end