class Market
  attr_reader :id,
              :name,
              :street,
              :city,
              :county,
              :state,
              :zip,
              :lat,
              :lon,
              :vendor_count

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:attributes][:name]
    @street = attributes[:attributes][:street]
    @city = attributes[:attributes][:city]
    @county = attributes[:attributes][:county]
    @state = attributes[:attributes][:state]
    @zip = attributes[:attributes][:zip]
    @lat = attributes[:attributes][:lat]
    @lon = attributes[:attributes][:lon]
    @vendor_count = attributes[:attributes][:vendor_count]
  end
end