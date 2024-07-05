=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.534.3

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # Data from a government watchlist or PEP list that has been attached to the screening.
  class WatchlistScreeningHit
    # ID of the associated screening hit.
    attr_accessor :id

    attr_accessor :review_status

    # An ISO8601 formatted timestamp.
    attr_accessor :first_active

    # An ISO8601 formatted timestamp.
    attr_accessor :inactive_since

    # An ISO8601 formatted timestamp.
    attr_accessor :historical_since

    attr_accessor :list_code

    # A universal identifier for a watchlist individual that is stable across searches and updates.
    attr_accessor :plaid_uid

    # The identifier provided by the source sanction or watchlist. When one is not provided by the source, this is `null`.
    attr_accessor :source_uid

    attr_accessor :analysis

    attr_accessor :data

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'review_status' => :'review_status',
        :'first_active' => :'first_active',
        :'inactive_since' => :'inactive_since',
        :'historical_since' => :'historical_since',
        :'list_code' => :'list_code',
        :'plaid_uid' => :'plaid_uid',
        :'source_uid' => :'source_uid',
        :'analysis' => :'analysis',
        :'data' => :'data'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'String',
        :'review_status' => :'WatchlistScreeningHitStatus',
        :'first_active' => :'Time',
        :'inactive_since' => :'Time',
        :'historical_since' => :'Time',
        :'list_code' => :'IndividualWatchlistCode',
        :'plaid_uid' => :'String',
        :'source_uid' => :'String',
        :'analysis' => :'ScreeningHitAnalysis',
        :'data' => :'ScreeningHitData'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'inactive_since',
        :'historical_since',
        :'source_uid',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::WatchlistScreeningHit` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::WatchlistScreeningHit`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'review_status')
        self.review_status = attributes[:'review_status']
      end

      if attributes.key?(:'first_active')
        self.first_active = attributes[:'first_active']
      end

      if attributes.key?(:'inactive_since')
        self.inactive_since = attributes[:'inactive_since']
      end

      if attributes.key?(:'historical_since')
        self.historical_since = attributes[:'historical_since']
      end

      if attributes.key?(:'list_code')
        self.list_code = attributes[:'list_code']
      end

      if attributes.key?(:'plaid_uid')
        self.plaid_uid = attributes[:'plaid_uid']
      end

      if attributes.key?(:'source_uid')
        self.source_uid = attributes[:'source_uid']
      end

      if attributes.key?(:'analysis')
        self.analysis = attributes[:'analysis']
      end

      if attributes.key?(:'data')
        self.data = attributes[:'data']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @id.nil?
        invalid_properties.push('invalid value for "id", id cannot be nil.')
      end

      if @review_status.nil?
        invalid_properties.push('invalid value for "review_status", review_status cannot be nil.')
      end

      if @first_active.nil?
        invalid_properties.push('invalid value for "first_active", first_active cannot be nil.')
      end

      if @list_code.nil?
        invalid_properties.push('invalid value for "list_code", list_code cannot be nil.')
      end

      if @plaid_uid.nil?
        invalid_properties.push('invalid value for "plaid_uid", plaid_uid cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @id.nil?
      return false if @review_status.nil?
      return false if @first_active.nil?
      return false if @list_code.nil?
      return false if @plaid_uid.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          review_status == o.review_status &&
          first_active == o.first_active &&
          inactive_since == o.inactive_since &&
          historical_since == o.historical_since &&
          list_code == o.list_code &&
          plaid_uid == o.plaid_uid &&
          source_uid == o.source_uid &&
          analysis == o.analysis &&
          data == o.data
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, review_status, first_active, inactive_since, historical_since, list_code, plaid_uid, source_uid, analysis, data].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      self.class.openapi_types.each_pair do |key, type|
        if attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = Plaid.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
