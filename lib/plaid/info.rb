module Plaid
  # Public: Representation of user information.
  class Info
    # Public: The Array of String user names.
    #
    # E.g. ["Frodo Baggins", "Samwise Gamgee"].
    attr_reader :names

    # Public: The Array of Hash user emails information.
    #
    # E.g. [{data: "frodo.baggins@plaid.com", type: :primary}, ...]
    attr_reader :emails

    # Public: The Array of Hash user phone number information.
    #
    # E.g. [{data: "111-222-3456", type: :work, primary: false},
    #       {data: "123-456-7891", type: :mobile, primary: true}]
    attr_reader :phone_numbers

    # Public: The Array of Hash user address information.
    #
    # E.g. [{ primary: true, data: {
    #                          "street" => "1 Hobbit Way",
    #                          "city" => "The Shire",
    #                          "state" => "CA",
    #                          "zip" => "94108"}}]
    attr_reader :addresses

    # Internal: Construct the Info object.
    def initialize(fields)
      @names = fields['names']
      @emails = fields['emails'].map do |h|
        symbolize_values Plaid.symbolize_hash(h), :type
      end

      @phone_numbers = fields['phone_numbers'].map do |h|
        symbolize_values Plaid.symbolize_hash(h), :type
      end

      @addresses = fields['addresses'].map do |h|
        Plaid.symbolize_hash(h)
      end
    end

    # Public: Get a String representation of Info object.
    #
    # Returns a String.
    def inspect
      "#<Plaid::Info names=#{names.inspect}, ...>"
    end

    # Public: Get a String representation of Info object.
    #
    # Returns a String.
    alias to_s inspect

    private

    def symbolize_values(hash, *keys)
      hash.each do |k, v|
        hash[k] = v.to_sym if keys.include?(k)
      end
    end
  end
end
