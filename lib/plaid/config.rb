module Plaid
  module Configure
    attr_writer :client_id, :secret, :environment_location

    KEYS = [:client_id, :secret, :environment_location]

    def config
      yield self
      self
    end

  end
end
