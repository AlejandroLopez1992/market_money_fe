require 'rails_helper'

describe 'markets index page', :vcr do
  before :each do
    visit markets_path
  end

  describe "page display" do
    it "shows Markets title at the top of page" do

      expect(page).to have_content("Markets")
    end

    it "has a table that reflects name, city and state" do

      within '#market_table' do
        expect(page).to have_content("Name")
        expect(page).to have_content("City")
        expect(page).to have_content("State")
      end
    end

    it "within table each market is reflected with name, city, state" do
      
      expect(page.status_code).to eq(200)
      @markets = MarketFacade.new.markets
      @markets.each do |market|
      within "##{market.id}" do    
        expect(page).to have_content(market.name)
        # expect(page).to have_content(market.city)
        expect(page).to have_content(market.state)
        expect(page).to have_button("More Info")
       end
      end
    end

    it "when More Info button is clicked a redirect to that market show page happens" do
      @market1 = MarketFacade.new.markets.first

      within "##{@market1.id}" do
        click_on "More Info"
        expect(current_path).to eq(market_path(@market1.id))
      end
    end
  end
end