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

  def market
    data = MarketMoneyService.new.market(@id)
    Market.new(data[:data])
  end

  def vendors
    data = MarketMoneyService.new.vendors(@id)
    @_vendors ||= data[:data].map do |vendor_info|
      Vendor.new(vendor_info)
    end
  end
end