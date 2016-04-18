class AltFuel < OpenStruct
  attr_reader :service

  def self.service
    @service ||=  NrelService.new
  end

  def self.find_by(args)
    zip = args[:zip]
    distance = args[:distance]
    json = service.alternate_fuel(zip, distance)
    stations = json[:fuel_stations]
    stations = stations.map do |station|
      AltFuel.new(station)
    end
    return stations
  end

end
