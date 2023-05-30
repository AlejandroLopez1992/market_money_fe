class VendorFacade
  def initialize(id = nil)
    @id = id
  end

  def vendor
    data = MarketMoneyService.new
    Vendor.new(data.vendor(@id)[:data])
  end
end