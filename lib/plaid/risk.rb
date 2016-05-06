module Plaid
  # Public: Representation of risk data (per account).
  class Risk
    # Public: The Float comprehensive risk score associated with the account,
    # where 0 is the lowest risk and 1 is the highest. E.g. 0.5.
    attr_reader :score

    # Public: The Hash with Symbol reasons and associated Float subscores
    # contributing to the overall risk score.
    #
    # E.g. { transaction_amounts: 0.78, foreign_fees: 0.96, ... }.
    attr_reader :reason

    # Internal: Construct a Risk object.
    #
    # fields - The Hash with fields.
    def initialize(fields)
      @score = fields['score']
      @reason = Plaid.symbolize_hash(fields['reason'])
    end

    # Public: Get a String representation of Risk.
    #
    # Returns a String.
    def inspect
      "#<Plaid::Risk score=#{score.inspect}, ..."
    end

    # Public: Get a String representation of Risk.
    #
    # Returns a String.
    alias to_s inspect
  end
end
