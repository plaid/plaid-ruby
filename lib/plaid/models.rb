require 'hashie'

module Plaid
  module Models
    class BaseModel < Hashie::Dash
      include Hashie::Extensions::Dash::IndifferentAccess
      include Hashie::Extensions::Dash::Coercion

      # We support two modes for parsing response bodies.
      #
      # Relaxed mode (default). If a response contains an unknown
      # attribute, it won't cause any error and will be accessible
      # using brackets notation: `response['unknown_attribute']`.
      #
      # Strict mode. Unknown attributes will cause NoMethodError.
      # This is the mode that we want for tests to ensure that
      # plaid-ruby's response models are correct.
      def assert_property_exists!(property)
        super if ENV['PLAID_STRICT_MODELS']
      end
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

    class IncomeStream < BaseModel
      # Public: The Numeric monthly income associated with the income stream.
      property :monthly_income

      # Public: The Numeric representation of our confidence in the income data
      # associated with this particular income stream, with 0 being the lowest
      # confidence and 1 being the highest.
      property :confidence

      # Public: The Numeric extent of data found for this income stream.
      property :days

      # Public: The String name of the entity associated with this income
      # stream.
      property :name
    end

    class Income < BaseModel
      # Public: An array of income streams with detailed information on each.
      property :income_streams, coerce: Array[IncomeStream]

      # Public: The Numeric last year income, i.e. the sum of the Item’s income
      # over the past 365 days. If Plaid has less than 365 days of data this will
      # be less than a full year's income.
      property :last_year_income

      # Public: The Numeric last_year_income interpolated to value before
      # taxes. This is the minimum pre-tax salary that assumes a filing status
      # of single with zero dependents.
      property :last_year_income_before_tax

      # Public: The Numeric income extrapolated over a year based on current,
      # active income streams. Income streams become inactive if they have not
      # recurred for more than two cycles. For example, if a weekly paycheck
      # hasn’t been seen for the past two weeks, it is no longer active.
      property :projected_yearly_income

      # Public: The Numeric projected_yearly_income interpolated to value
      # before taxes. This is the minimum pre-tax salary that assumes a filing
      # status of single with zero dependents.
      property :projected_yearly_income_before_tax

      # Public: The Numeric max number of income streams present at the same
      # time over the past 365 days.
      property :max_number_of_overlapping_income_streams

      # Public: The Numeric total number of distinct income streams received
      # over the past 365 days.
      property :number_of_income_streams
    end

    class InstitutionCredential < BaseModel
      # Public: The String label. E.g. "User ID".
      property :label

      # Public: The String name. E.g. "username".
      property :name

      # Public: The String type. E.g. "text", or "password".
      property :type
    end

    class Institution < BaseModel
      property :credentials, coerce: Array[InstitutionCredential]

      # Public: The Boolean flag indicating if the institution uses MFA.
      property :has_mfa

      # Public: The String institution ID (e.g. "ins_109512").
      property :institution_id

      # Public: The String institution name (e.g. "Houndstooth Bank").
      property :name

      # Public: The Array of String MFA types.
      # E.g. ["code", "list", "questions", "selections"].
      property :mfa

      # Public: The Array of String product names supported by this institution.
      # E.g. ["auth", "balance", "identity", "transactions"].
      property :products
    end

    module MFA
      class Device < BaseModel
        property :display_message
      end

      class DeviceListElement < BaseModel
        # Public: The String device ID.
        property :device_id

        # Public: The String device mask.
        property :mask

        # Public: The String device type.
        property :type
      end

      class Selection < BaseModel
        # Public: The String question.
        property :question

        # Public: The Array of String answers.
        property :answers
      end
    end

    class TransactionLocation < BaseModel
      # Public: The String address (or nil).
      property :address

      # Public: The String city name (or nil).
      property :city

      # Public: The Numeric latitude of the place (or nil).
      property :lat

      # Public: The Numeric longitude of the place (or nil).
      property :lon

      # Public: The String state name (or nil).
      property :state

      # Public: The String store number (or nil).
      property :store_number

      # Public: The String ZIP code (or nil).
      property :zip
    end

    class TransactionPaymentMeta < BaseModel
      property :by_order_of
      property :ppd_id
      property :payee
      property :payer
      property :payment_method
      property :payment_processor
      property :reason
      property :reference_number
    end

    class Transaction < BaseModel
      # Public: The String transaction ID.
      property :transaction_id

      # Public: The String account ID.
      property :account_id

      # Public: The String account owner (or nil).
      property :account_owner

      # Public: The Numeric amount (or nil).
      property :amount

      # Public: The Array of String category (or nil).
      # E.g. ["Payment", "Credit Card"].
      property :category

      # Public: The String category_id (or nil).
      # E.g. "16001000".
      property :category_id

      # Public: The String transaction date. E.g. "2017-01-01".
      property :date

      # Public: The location where transaction occurred.
      property :location, coerce: TransactionLocation

      # Public: The String transaction name (or nil).
      # E.g. "CREDIT CARD 3333 PAYMENT *//".
      property :name

      # Public: The String original description (or nil).
      property :original_description

      # Public: The payment meta information.
      property :payment_meta, coerce: TransactionPaymentMeta

      # Public: The Boolean pending flag (or nil).
      property :pending

      # Public: The String pending transaction ID (or nil).
      property :pending_transaction_id

      # Public: The String transaction type (or nil). E.g. "special", or
      # "place".
      property :transaction_type
    end
  end
end
