class MarketMoneyService

  def conn
    @conn ||= Faraday.new(url: "http://localhost:3000")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def markets
    get_url("api/v0/markets")
  end
end