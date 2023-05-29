require 'rails_helper'

describe 'markets index page' do
  before :each do
    stub_request(:any, "http://localhost:3000/api/v0/markets").
    to_return(body: {
      "data": [
          {
              "id": "322458",
              "type": "market",
              "attributes": {
                  "name": "14&U Farmers' Market",
                  "street": "1400 U Street NW ",
                  "city": "Washington",
                  "county": "District of Columbia",
                  "state": "District of Columbia",
                  "zip": "20009",
                  "lat": "38.9169984",
                  "lon": "-77.0320505",
                  "vendor_count": 1
              }},{
                "id": "322474",
                "type": "market",
                "attributes": {
                    "name": "2nd Street Farmers' Market",
                    "street": "194 second street",
                    "city": "Amherst",
                    "county": "Amherst",
                    "state": "Virginia",
                    "zip": "24521",
                    "lat": "37.583311",
                    "lon": "-79.048573",
                    "vendor_count": 35
                }}]}) status: 200

  end

  describe "page display" do
    it "shows Markets title at the top of page" do
      visit markets_path

      expect(page).to have_content("Markets")
    end

    it "has a table that reflects name, city and state" do
      visit markets_path

      within '#market_table' do
        expect(page).to have_content("Name")
        expect(page).to have_content("City")
        expect(page).to have_content("State")
      end
    end

    it "within table each market is reflected with name, city, state" do
      Net::HTTP.get("http://localhost:3000/api/v0/markets", '/') 

      within '#market_table' do
      
      expect(response).to be_successful
  
      markets = JSON.parse(response.body, symbolize_names: true)
  
      expect(markets[:data].count).to eq(2)
  
      markets[:data].each do |market|
        expect(market).to have_key(:id)
        expect(market[:id]).to be_a(String)

        expect(market).to have_key(:type)
        expect(market[:type]).to be_a(String)
        expect(market[:type]).to eq("market")

        expect(market).to have_key(:attributes)
        expect(market[:attributes]).to be_a(Hash)
  
        expect(market[:attributes]).to have_key(:name)
        expect(market[:attributes][:name]).to be_a(String)
  
        expect(market[:attributes]).to have_key(:street)
        expect(market[:attributes][:street]).to be_a(String)
  
        expect(market[:attributes]).to have_key(:city)
        expect(market[:attributes][:city]).to be_a(String)
  
        expect(market[:attributes]).to have_key(:county)
        expect(market[:attributes][:county]).to be_a(String)
  
        expect(market[:attributes]).to have_key(:state)
        expect(market[:attributes][:state]).to be_a(String)
  
        expect(market[:attributes]).to have_key(:zip)
        expect(market[:attributes][:zip]).to be_a(String)
  
        expect(market[:attributes]).to have_key(:lat)
        expect(market[:attributes][:lat]).to be_a(String)
  
        expect(market[:attributes]).to have_key(:lon)
        expect(market[:attributes][:lon]).to be_a(String)

        expect(market[:attributes]).to have_key(:vendor_count)
        expect(market[:attributes][:vendor_count]).to be_an(Integer)
      end
    end
  end
end