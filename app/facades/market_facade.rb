class MarketFacade
  def initialize(id = nil)
    @id = id 
  end

  def markets
    conn  = Faraday.new(url: 'http://localhost:3000') do |faraday|
    end
    
    response = conn.get("/api/v0/markets")
    json = JSON.parse(response.body, symbolize_names: true)
    @markets = json[:data].map do |market_data|
      Market.new(market_data)
    end
  end
end