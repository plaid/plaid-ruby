module Plaid
  class Institution
    attr_accessor :id, :name, :type, :has_mfa, :mfa

    def initialize(id, name, type, has_mfa, mfa)
      @id = id
      @name = name
      @type = type
      @has_mfa = has_mfa
      @mfa = mfa
    end

    # API: semi-private
    # This method takes an array returned from the API and instantiates all of the institutions
    def self.all(res)
      res.map { |inst| build(inst) }
    end

    # API: semi-private
    # This method instantiates and builds a single institutions
    def self.build(inst)
      new(inst['id'], inst['name'], inst['type'], inst['has_mfa'], inst['mfa'])
    end
  end
end

