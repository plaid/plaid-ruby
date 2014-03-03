module Plaidio
  module Configure
    attr_writer :customer_id, :secret

    KEYS = [:customer_id, :secret]

    def config
      yield self
      self
    end

  end
end
