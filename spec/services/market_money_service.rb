require 'rails_helper'

RSpec.describe "market_money_service" do
  it "establishes connection", :vcr do
    conn = MarketMoneyService.new
    json = conn.markets

    expect(json).to be_a(Hash)
    expect(json).to have_key(:data)
    expect(json[:data]).to all(have_key(:id))
    expect(json[:data]).to all(have_key(:type))
    expect(json[:data]).to all(have_key(:attributes))
    
    expect(json[:data].first[:id]).to be_a(String)
    expect(json[:data].first[:type]).to be_a(String)
    expect(json[:data].first[:attributes]).to be_a(Hash)
  end
end