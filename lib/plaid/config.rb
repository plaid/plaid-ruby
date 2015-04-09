module Plaid
  module Configure
    attr_accessor :customer_id, :secret, :environment_location

    KEYS = [:customer_id, :secret, :environment_location]

    def config
      yield self

      # Add trailing slash to api url if it is not present
      if self.environment_location[-1] != '/'
        self.environment_location += '/'
      end

      self
    end

  end
end
