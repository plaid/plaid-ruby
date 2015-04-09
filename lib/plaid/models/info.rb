module Plaid
  class Information
    attr_accessor :names, :emails, :phone_numbers, :addresses

    def new
      self.names = []
      self.emails = []
      self.phone_numbers = []
      self.addresses = ''
    end

    def update_info(res)
      self.names = res['names']
      self.emails = res['emails']
      self.phone_numbers = res['phone_numbers']
      self.addresses = res['addresses']
    end
  end

end
