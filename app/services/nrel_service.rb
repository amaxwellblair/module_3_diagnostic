class NrelService
  attr_reader :connection

  def initialize
    @connection = Faraday.new('https://api.data.gov')
    connection.params[:api_key] = ENV['NREL_KEY']
  end

  def alternate_fuel(zip_code)
    response = connection.get("/nrel/alt-fuel-stations/v1/nearest.json?location=#{zip_code}")
  end

end