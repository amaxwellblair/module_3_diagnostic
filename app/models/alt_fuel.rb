class AltFuel

  def self.find_by(args)
    zip = args[:zip]
    api = NrelService.new
    return api.alternate_fuel(zip)
  end

end
