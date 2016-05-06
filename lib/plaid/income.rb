module Plaid
  # Public: Representation of Income data.
  class Income
    # Public: The class encapsulating an income stream.
    class Stream
      # Public: The Float monthly income associated with the income stream.
      # E.g. 5700.
      attr_reader :monthly_income

      # Public: The Float representation of Plaid's confidence in the income
      # data associated with this particular income stream, with 0 being
      # the lowest confidence and 1 being the highest. E.g. 0.9.
      attr_reader :confidence

      # Public: The Integer extent of data found for this income stream.
      # E.g. 314.
      attr_reader :days

      # Public: The String name of the entity associated with this income
      # stream. E.g. "APPLE INC".
      attr_reader :name

      # Internal: Initialize a Stream.
      #
      # fields - The Hash with fields (keys are Strings).
      def initialize(fields)
        @monthly_income = fields['monthly_income']
        @confidence = fields['confidence']
        @days = fields['days']
        @name = fields['name']
      end

      # Public: Get a String representation of the Stream.
      #
      # Returns a String.
      def inspect
        "#<Plaid::Income::Stream name=#{name.inspect}, " \
          "monthly_income=#{monthly_income.inspect}, " \
          "confidence=#{confidence.inspect}, " \
          "days=#{days.inspect}>"
      end

      # Public: Get a String representation of the Stream.
      #
      # Returns a String.
      alias to_s inspect
    end

    # Public: The Array of Stream.
    attr_reader :income_streams

    # Public: The Numeric sum of user's income over the past 365 days. If Plaid
    # has less than 365 days of data this will be less than a full year income.
    # E.g. 67000.
    attr_reader :last_year_income

    # Public: The last_year_income interpolated to value before taxes. This is
    # the minimum pre-tax salary that assumes a filing status of single with
    # zero dependents. E.g. 73700.
    attr_reader :last_year_income_before_tax

    # Public: The Numeric user's income extrapolated over a year based on
    # current, active income streams. Income streams become inactive if they
    # have not recurred for more than two cycles. For example, if a weekly
    # paycheck hasn't been seen for the past two weeks, it is no longer active.
    # E.g. 69800.
    attr_reader :projected_yearly_income

    # Public: The projected_yearly_income interpolated to value before taxes.
    # This is the minimum pre-tax salary that assumes a filing status of single
    # with zero dependents. E.g. 75600.
    attr_reader :projected_yearly_income_before_tax

    # Public: The Integer max number of income streams present at the same time
    # over the past 365 days. E.g. 314.
    attr_reader :max_number_of_overlapping_income_streams

    # Public: The Integer total number of distinct income streams received over
    # the past 365 days. E.g. 2.
    attr_reader :number_of_income_streams

    def initialize(fields)
      @income_streams = fields['income_streams'].map { |is| Stream.new(is) }

      %w(last_year_income last_year_income_before_tax projected_yearly_income
         projected_yearly_income_before_tax number_of_income_streams
         max_number_of_overlapping_income_streams).each do |field|
        instance_variable_set "@#{field}", fields[field]
      end
    end

    # Public: Get a String representation of Income.
    #
    # Returns a String.
    def inspect
      "#<Plaid::Income last_year_income=#{last_year_income.inspect}, " \
        "projected_yearly_income=#{projected_yearly_income.inspect}, " \
        "number_of_income_streams=#{number_of_income_streams.inspect}, ...>"
    end

    # Public: Get a String representation of Income.
    #
    # Returns a String.
    alias to_s inspect
  end
end
