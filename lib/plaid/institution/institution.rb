require 'plaid/util'
module Plaid
  class Institution
    include Plaid::Util

    attr_accessor(:id, :name, :type, :has_mfa, :mfa, :inst_array)

    def instantiate_all_institutions(res)
      self.inst_array = []
      puts 'Trying to build many institutions'
      res.each do |inst|
        institution = Institution.new
        inst_array << institution.build_institution(inst)
      end
      self.inst_array
    end

    def instantiate_one_institution(res)
      puts 'Trying to build one institution'
      self.build_institution(res)
    end

    protected

    def build_institution(inst)
      self.id = inst['id'], self.name = inst['name'], self.type = inst['type'], self.has_mfa =inst['has_mfa'], self.mfa = inst['mfa']
    end

  end
end