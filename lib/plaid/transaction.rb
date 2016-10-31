# coding: utf-8
require 'date'

module Plaid
  # Public: Representation of a transaction.
  class Transaction
    # Public: The String unique ID of the transaction. E.g.
    # "0AZ0De04KqsreDgVwM1RSRYjyd8yXxSDQ8Zxn".
    attr_reader :id

    # Public: The String ID of the account in which this transaction occurred.
    # E.g. "XARE85EJqKsjxLp6XR8ocg8VakrkXpTXmRdOo".
    attr_reader :account_id

    # Public: The Date that the transaction took place.
    # E.g. #<Date: 2016-04-28 ...>
    attr_reader :date

    # Public: The settled dollar value as Float. Positive values when
    # money moves out of the account; negative values when money moves
    # in. E.g. 0.10 (10 cents).
    attr_reader :amount

    # Public: The String descriptive name of the transaction. E.g.
    # "Golden Crepes".
    attr_reader :name

    # Public: The Hash with additional information regarding the
    # transaction. The keys are Symbols. E.g.
    # { location: { "city": "San Francisco", "state": "CA" } }
    attr_reader :meta

    # Public: The Hash with location information obtained from the
    # meta field. The keys are Strings.
    #
    # E.g. {"address" => "262 W 15th St",
    #       "city" => "New York",
    #       "state" => "NY",
    #       "zip" => "10011",
    #       "coordinates" => {
    #         "lat" => 40.740352,
    #         "lon" => -74.001761
    #       }}
    attr_reader :location

    # Public: The Boolean flag which identifies the transaction as
    # pending or unsettled.
    attr_reader :pending

    # Public: The Hash with numeric representation of Plaid confidence
    # in the meta data attached to the transaction. In the case of a
    # score <.9 Plaid will default to guaranteed and known
    # information. E.g.
    #
    # {location: {
    #    "address" => 1,
    #    "city" => 1,
    #    "state" => 1
    #  }, name: 0.9}.
    attr_reader :score

    # Public: The Hash transaction type.
    #
    # E.g. {:primary => :place}.
    attr_reader :type

    # Public: The Array of String category hierarchy.
    #
    # E.g. ["Food and Drink", "Restaurants"].
    attr_reader :category_hierarchy

    # Public: The String Category ID.
    #
    # E.g. "13005000".
    attr_reader :category_id

    # Public: A String attribute that is used by the bank/payment
    # processor to identify transactions — where applicable.
    attr_reader :reference_number

    # Public: The String ID of a posted transaction's associated
    # pending transaction - where applicable.
    attr_reader :pending_transaction_id

    # Public: Initialize a Transaction instance.
    #
    # fields - The Hash with fields.
    def initialize(fields)
      @id = fields['_id']
      @account_id = fields['_account']

      @date = fields['date'] && Date.parse(fields['date'])
      @amount = fields['amount']
      @name = fields['name']
      @meta = Plaid.symbolize_hash(fields['meta'])
      @location = (@meta && @meta[:location]) || {}
      @pending = fields['pending']
      @reference_number = fields['_reference_number']
      @pending_transaction_id = fields['_pendingTransaction']
      @score = Plaid.symbolize_hash(fields['score'])

      @type = Plaid.symbolize_hash(fields['type'], values: true)
      @category_hierarchy = fields['category']
      @category_id = fields['category_id']
    end

    # Public: Detect if the transaction is pending or unsettled.
    #
    # Returns true if it is.
    def pending?
      pending
    end

    # Public: Get a String representation of the transaction.
    #
    # Returns a String.
    def inspect
      "#<Plaid::Transaction id=#{id.inspect}, account_id=#{account_id.inspect}, " \
      "date=#{date}, amount=#{amount.inspect}, name=#{name.inspect}, " \
      "pending=#{pending.inspect}>"
    end

    # Public: Get a String representation of the transaction.
    #
    # Returns a String.
    alias to_s inspect
  end
end
