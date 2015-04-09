module Plaid
  class Information
    attr_accessor :names, :emails, :phone_numbers, :addresses

    def initialize
      self.names = []
      self.emails = []
      self.phone_numbers = []
      self.addresses = ''
    end

    # API: semi-private
    # Updates an information instance with results returned from the API
    def update(res)
      self.names = res['names']
      self.emails = res['emails']
      self.phone_numbers = res['phone_numbers']
      self.addresses = res['addresses']
    end

    class << self
      # API: semi-private
      # Instantiates and populates a new Plaid::Information object
      def build(res)
        self.new.update(res)
      end
    end
  end

end
