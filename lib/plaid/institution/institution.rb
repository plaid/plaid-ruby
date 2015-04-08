module Plaid
  class Institution

    attr_accessor :id, :name, :type, :has_mfa, :mfa

    class << self
      def all(res)
        res.map { |cat| self.one(cat) }
      end

      def one(res)
        self.new.build(res)
      end
    end

    def build(inst)
      self.id = inst['id']
      self.name = inst['name']
      self.type = inst['type']
      self.has_mfa = inst['has_mfa']
      self.mfa = inst['mfa']
      return self
    end

  end
end
