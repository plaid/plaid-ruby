module Plaid
  class Information
    attr_accessor :names, :emails, :phone_numbers, :addresses

    def initialize(hash)
      @names = hash['names']
      @emails = hash['emails']
      @phone_numbers = hash['phone_numbers']
      @addresses = hash['addresses']
    end
  end
end
