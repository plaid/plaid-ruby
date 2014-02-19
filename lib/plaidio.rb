require 'plaidio/config.rb'
module Plaidio 
  class << self
    include Plaidio::Configure
    
    def self.get 
      return "The getting is good"
    end
    
  end
end