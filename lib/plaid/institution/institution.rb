require 'plaid/util'
module Plaid
  class Institution
    include Plaid::Util

    attr_accessor(:id, :name, :type, :has_mfa, :mfa)

    # Returns an instantiated category object, or an array of all categories
    def new(id=nil)
      res = get('institutions',id)
      id.nil? ? cat = instantiate_all_institutions(res) : cat = instantiate_one_institution(res)
      cat
    end

    def instantiate_all_institutions(res)
      inst_array = []
      res['institution'].each do |inst|
        @institution = Institution.new
        inst_array << @institution.build_institution(inst)
      end
      inst_array
    end

    def instantiate_one_institution(res)
      @category = Institution.new
      @category.build_institution(res)
    end

    protected

    def build_institution(cat)
      self.id = cat['id'], self.name = cat['name'], self.type = cat['type'], self.has_mfa = cat['has_mfa'], self.mfa = cat['mfa']
    end

  end
end