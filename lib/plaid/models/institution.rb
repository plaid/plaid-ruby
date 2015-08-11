module Plaid
  class Institution
    attr_accessor :id, :credentials, :name, :type, :has_mfa, :mfa

    def initialize(fields = {})
      @id = fields['id']
      @credentials = fields['credentials']
      @name = fields['name']
      @type = fields['type']
      @has_mfa = fields['has_mfa']
      @mfa = fields['mfa']
    end

    # API: semi-private
    # This method takes an array returned from the API and instantiates all of the institutions
    def self.all(res)
      res.map { |inst| new(inst) }
    end
  end
end

