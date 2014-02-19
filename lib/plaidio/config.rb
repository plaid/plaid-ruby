module Plaidio 
  module Configure 
    attr_writer[:client_id, :secret]
    def config 
      yield self 
      self
    end
  end
end