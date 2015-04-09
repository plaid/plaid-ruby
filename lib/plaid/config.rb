module Plaid
  module Configure
    attr_accessor :customer_id, :secret, :environment_location

    KEYS = [:customer_id, :secret, :environment_location]

    def config
      yield self
      self
    end

  end
end
