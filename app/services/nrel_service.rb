class NrelService
  attr_reader :connection

  def initialize
    @connection = Faraday.new('https://api.data.gov')
    connection.params[:api_key] = ENV['NREL_KEY']
  end

  def alternate_fuel(zip_code)
    response = connection.get("/nrel/alt-fuel-stations/v1/nearest.json?location=#{zip_code}&fuel_type=ELEC,LPG&limit=10")
    parse(response)
  end

  private

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end

end
