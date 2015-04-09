module Plaid
  class Institution

    attr_accessor :id, :name, :type, :has_mfa, :mfa

    class << self
      # API: semi-private
      # This method takes an array returned from the API and instantiates
      # all of the categories
      def all(res)
        res.map { |cat| self.build(cat) }
      end

      # API: semi-private
      # This method instantiates and builds a single category
      def build(res)
        self.new.update(res)
      end
    end

    # API: semi-private
    # This method updates a Plaid:Institution based upon the results from the API
    def update(inst)
      self.id = inst['id']
      self.name = inst['name']
      self.type = inst['type']
      self.has_mfa = inst['has_mfa']
      self.mfa = inst['mfa']
      return self
    end

  end
end
