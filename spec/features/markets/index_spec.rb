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
      require 'pry'; binding.pry
      expect(page.status_code).to eq(200)
      within '#market_table' do    
        # markets[:data].each do |market|
        #   expect(market).to have_key(:id)
        #   expect(market[:id]).to be_a(String)

        #   expect(market).to have_key(:type)
        #   expect(market[:type]).to be_a(String)
        #   expect(market[:type]).to eq("market")

        #   expect(market).to have_key(:attributes)
        #   expect(market[:attributes]).to be_a(Hash)
    
        #   expect(market[:attributes]).to have_key(:name)
        #   expect(market[:attributes][:name]).to be_a(String)
    
        #   expect(market[:attributes]).to have_key(:street)
        #   expect(market[:attributes][:street]).to be_a(String)
    
        #   expect(market[:attributes]).to have_key(:city)
        #   expect(market[:attributes][:city]).to be_a(String)
    
        #   expect(market[:attributes]).to have_key(:county)
        #   expect(market[:attributes][:county]).to be_a(String)
    
        #   expect(market[:attributes]).to have_key(:state)
        #   expect(market[:attributes][:state]).to be_a(String)
    
        #   expect(market[:attributes]).to have_key(:zip)
        #   expect(market[:attributes][:zip]).to be_a(String)
    
        #   expect(market[:attributes]).to have_key(:lat)
        #   expect(market[:attributes][:lat]).to be_a(String)
    
        #   expect(market[:attributes]).to have_key(:lon)
        #   expect(market[:attributes][:lon]).to be_a(String)

        #   expect(market[:attributes]).to have_key(:vendor_count)
        #   expect(market[:attributes][:vendor_count]).to be_an(Integer)
        # end
      end
    end
  end
end