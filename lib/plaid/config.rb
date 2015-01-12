module Plaid
  module Configure
    attr_writer :customer_id, :secret, :environment_location

    KEYS = [:customer_id, :secret, :environment_location]

    def config
      yield self
      self
    end

  end
end