require 'rails_helper'
RSpec.describe "vendors#show" do
  describe "Page display" do
    it "shows vendor name, contact info, credit_accepted, and description", :vcr do
      visit vendor_path(54958)
      
      expect(page).to have_content("The Vegan Ice Cream Shop")
      expect(page).to have_content("Description: This vendor sells vegan ice cream in a variety of flavors.")
      expect(page).to have_content("Contact Name: Keren Stroman")
      expect(page).to have_content("Phone: 551.131.1824")
      expect(page).to have_content("Credit Accepted: false")
    end
  end
end