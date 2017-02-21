module Zones

  def grab_zone(name)
    ZONE_LOOK_UP[name.to_sym]
  end

  ZONE_LOOK_UP = { :Euston => 1,
                   :Angel => 1,
                   :Bank => 1,
                   :Hammersmith => 2,
                   :Kilburn => 2,
                   :Brixton => 2,
                   :Neasdon => 3,
                   :Balham => 3,
                   :Wimbledon => 3,
                  }

end
