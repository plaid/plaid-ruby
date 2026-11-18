# frozen_string_literal: true

module Plaid
  module Internal
    module Types
      module Unknown
        include Plaid::Internal::Types::Type

        def coerce(value)
          value
        end
      end
    end
  end
end
