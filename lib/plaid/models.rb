require 'hashie'

module Plaid
  module Models
    class BaseModel < Hashie::Dash
      include Hashie::Extensions::Dash::IndifferentAccess
      include Hashie::Extensions::Dash::Coercion
    end

    class BaseResponse < BaseModel
      # Public: The String request ID assigned by the API.
      property :request_id
    end

    class Error < BaseModel
      # Public: The String broad categorization of the error. One of:
      # 'INVALID_REQUEST', 'INVALID_INPUT', 'RATE_LIMIT_EXCEEDED', 'API_ERROR',
      # or 'ITEM_ERROR'.
      property :error_type

      # Public: The particular String error code. Each error_type has a
      # specific set of error_codes.
      property :error_code

      # Public: A developer-friendly representation of the error message.
      property :error_message

      # Public: A user-friendly representation of the error message. nil if the
      # error is not related to user action.
      property :display_message
    end

    class Item < BaseModel
      # Public: The Array with String products available for this item
      # (e.g. ["balance", "auth"]).
      property :available_products

      # Public: The Array with String products billed for this item
      # (e.g. ["identity", "transactions"]).
      property :billed_products

      # Public: The String error related to
      property :error, coerce: Error

      # Public: The String institution ID for this item.
      property :institution_id

      # Public: The String item ID.
      property :item_id

      # Public: The String webhook URL.
      property :webhook
    end

    class Balances < BaseModel
      # Public: The Numeric available balance (or nil).
      property :available

      # Public: The Numeric current balance (or nil).
      property :current

      # Public: The Numeric limit (or nil).
      property :limit
    end

    class Account < BaseModel
      # Public: The String account ID, e.g. "QKKzevvp33HxPWpoqn6rI13BxW4awNSjnw4xv".
      property :account_id

      # Public: Balances for this account.
      property :balances, coerce: Balances

      # Public: The String mask, e.g. "0000".
      property :mask

      # Public: The String account name, e.g. "Plaid Checking".
      property :name

      # Public: The String official account name, e.g. "Plaid Gold Checking".
      property :official_name

      # Public: The String type, e.g. "depository".
      property :type

      # Public: The String subtype, e.g. "checking".
      property :subtype
    end

    class Number < BaseModel
      # Public: The String account number. E.g. "1111222233330000".
      property :account

      # Public: The String account ID. E.g. "vzeNDwK7KQIm4yEog683uElbp9GRLEFXGK98D".
      property :account_id

      # Public: The String routing number. E.g. "011401533".
      property :routing

      # Public: The String wire routing number. E.g. "021000021".
      property :wire_routing
    end

    class Category < BaseModel
      # Public: The String category ID. E.g. "10000000".
      property :category_id

      # Public: The Array of Strings category hierarchy.
      # E.g. ["Recreation", "Arts & Entertainment", "Circuses and Carnivals"].
      property :hierarchy

      # Public: The String category group. E.g. "place".
      property :group
    end

    class CreditDetailsAPR < BaseModel
      # Public: The Numeric APR (e.g. 0.125).
      property :apr

      # Public: The Numeric balance subject to APR (e.g. 1200).
      property :balance_subject_to_apr

      # Public: The Numeric interest charge amount (e.g. 150).
      property :interest_charge_amount
    end

    class CreditDetailsAPRs < BaseModel
      property :balance_transfers, coerce: CreditDetailsAPR
      property :cash_advances, coerce: CreditDetailsAPR
      property :purchases, coerce: CreditDetailsAPR
    end

    class CreditDetails < BaseModel
      # Public: The String account ID. E.g. "vzeNDwK7KQIm4yEog683uElbp9GRLEFXGK98D".
      property :account_id

      # Public: The APRs.
      property :aprs, coerce: CreditDetailsAPRs

      # Public: The Numeric last payment amount (e.g. 875).
      property :last_payment_amount

      # Public: The String last payment date. E.g. "2016-09-13T00:00:00Z".
      property :last_payment_date

      # Public: The Numeric last statement balance (e.g. 3450).
      property :last_statement_balance

      # Public: The String last statement date. E.g. "2016-10-01T00:00:00Z".
      property :last_statement_date

      # Public: The Numeric minimum payment amount (e.g. 800).
      property :minimum_payment_amount

      # Public: The String next bill due date. E.g. "2016-10-15T00:00:00Z".
      property :next_bill_due_date
    end

    class IdentityAddressData < BaseModel
      # Public: The String street name.
      property :street

      # Public: The String name.
      property :city

      # Public: The String state name.
      property :state

      # Public: The String ZIP code.
      property :zip
    end

    class IdentityAddress < BaseModel
      # Public: The Array of String accounts, associated with this address.
      # E.g. ["Plaid Credit Card 3333"].
      property :accounts

      # Public: The Boolean primary flag (true if it's the primary address).
      property :primary

      # Public: The address data
      property :data, coerce: IdentityAddressData
    end

    class IdentityEmail < BaseModel
      # Public: The String data, i.e. the address itself. E.g.
      # "accountholder0@example.com".
      property :data

      # Public: The Boolean primary flag.
      property :primary

      # Public: The String type. E.g. "primary", or "secondary", or "other".
      property :type
    end

    class IdentityPhoneNumber < BaseModel
      # Public: The String data, i.e. the number itself. E.g.
      # "4673956022".
      property :data

      # Public: The Boolean primary flag.
      property :primary

      # Public: The String type. E.g. "home", or "work", or "mobile1".
      property :type
    end

    class Identity < BaseModel
      property :addresses, coerce: Array[IdentityAddress]
      property :emails, coerce: Array[IdentityEmail]

      # Public: The Array of String names. E.g. ["John Doe", "Ronald McDonald"].
      property :names

      property :phone_numbers, coerce: Array[IdentityPhoneNumber]
    end
  end
end
