class MarketFacade
  def initialize(id = nil)
    @id = id 
  end

  def markets
    data = MarketMoneyService.new.markets
    @_markets ||= data[:data].map do |market_info|
      Market.new(market_info)
    end
  end
end