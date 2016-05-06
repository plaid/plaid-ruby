require 'plaid/risk'

module Plaid
  # Public: Representation of user account data.
  class Account
    # Public: The String unique ID of the account. E.g.
    # "QPO8Jo8vdDHMepg41PBwckXm4KdK1yUdmXOwK".
    attr_reader :id

    # Public: The String account ID unique to the accounts of a particular
    # access token. E.g. "KdDjmojBERUKx3JkDd9RuxA5EvejA4SENO4AA".
    attr_reader :item_id

    # Public: The Float value of the current balance for the account.
    attr_reader :current_balance

    # Public: The Float value of the available balance for the account.
    #
    # The Available Balance is the Current Balance less any outstanding holds
    # or debits that have not yet posted to the account. Note that not all
    # institutions calculate the Available Balance. In the case that Available
    # Balance is unavailable from the institution, Plaid will either return an
    # Available Balance value of null or only return a Current Balance.
    attr_reader :available_balance

    # Public: The Symbol institution type, e.g. :wells.
    attr_reader :institution

    # Public: The Hash with additional information pertaining to the account
    # such as the limit, name, or last few digits of the account number. E.g.
    # {"name": "Plaid Savings", "number": "9606" }.
    attr_reader :meta

    # Public: The Symbol account type. One of :depository, :credit, :loan,
    # :mortgage, :brokerage, and :other.
    attr_reader :type

    # Public: The String account subtype. E.g. "savings".
    #
    # Read more about subtypes in the Plaid API docs.
    attr_reader :subtype

    # Public: The Hash with account and routing numbers for the account.
    #
    # This attribute would be nil unless you used Auth product for the user.
    #
    # The Hash contains Symbol keys and String values. E.g.
    # {routing: "021000021", account: "9900009606", wireRouting: "021000021"}.
    attr_reader :numbers

    # Public: The Risk information associated with the account.
    #
    # This attribute would be nil unless you used Risk product for the user.
    attr_reader :risk

    def initialize(hash)
      @id          = hash['_id']
      @item_id     = hash['_item']
      @meta        = hash['meta']
      @type        = hash['type'].to_sym
      @subtype     = hash['subtype']
      @institution = hash['institution_type'].to_sym

      unless (bal = hash['balance']).nil?
        @available_balance = bal['available']
        @current_balance   = bal['current']
      end

      if (risk = hash['risk'])
        @risk = Plaid::Risk.new(risk)
      end

      @numbers = Plaid.symbolize_hash(hash['numbers'])
    end

    # Public: Get a String representation of the account.
    #
    # Returns a String.
    def inspect
      "#<Plaid::Account id=#{id.inspect}, type=#{type.inspect}, " \
      "name=#{name.inspect}, institution=#{institution.inspect}>"
    end

    # Public: Get a String representation of the account.
    #
    # Returns a String.
    alias to_s inspect

    # Public: Get the account name.
    #
    # The name is obtained from #meta Hash.
    #
    # Returns the String name.
    def name
      meta && meta['name']
    end

    # Internal: Merge account information.
    #
    # accounts     - The Array of Account instances.
    # new_accounts - The Array of Account instances.
    #
    # Returns accounts.
    def self.merge(accounts, new_accounts)
      # Index accounts by their ID.
      #
      # Same as index = accounts.index_by(&:id) in ActiveSupport.
      index = Hash[accounts.map { |a| [a.id, a] }]

      new_accounts.each do |acc|
        if (old_acc = index[acc.id])
          old_acc.update_from(acc)
        else
          accounts << acc
        end
      end

      accounts
    end

    # Internal: Update account information.
    #
    # All fields which are not nil in another are copied to self.
    #
    # another - The Account instance with new information.
    #
    # Returns self.
    def update_from(another)
      # A sanity check. Nobody would want to update information from totally
      # different account!
      if id != another.id
        raise ArgumentError, 'Plaid::Account#update_from: id != another.id!'
      end

      %i(item_id meta name type subtype institution available_balance
         current_balance numbers risk).each do |field|
        value = another.send(field)
        instance_variable_set("@#{field}", value) unless value.nil?
      end

      self
    end
  end
end
