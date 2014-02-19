module Plaidio 
  module Configure 
    attr_writer :customer_id, :secret
    
    KEYS = [:customer_id, :secret]
    
    def config 
      yield self 
      self
    end
    
    private
    
    def options
      Plaidio::Configure::KEYS.inject({}) { |hash, key| hash[key] = instance_variable_get(:"@#{key}"); hash }
    end
    
  end
end