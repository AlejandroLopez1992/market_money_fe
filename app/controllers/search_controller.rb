class SearchController < ApplicationController

  def index

    markets = "markets"

    conn  = Faraday.new(url: 'localhost:3000') do |faraday|
    end
    
    response = conn.get("/api/v0/#{markets}")

    json = JSON.parse(response.body, symbolize_name: true)
    @markets = json[:data]

    require 'pry'; binding.pry
  end
end