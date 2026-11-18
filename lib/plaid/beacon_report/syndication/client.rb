# frozen_string_literal: true

module Plaid
  module BeaconReport
    module Syndication
      class Client
        # @param client [Plaid::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use the `/beacon/report_syndication/list` endpoint to view all Beacon Reports that have been syndicated to a
        # specific Beacon User. This endpoint returns Beacon Report Syndications which are references to Beacon Reports
        # created either by you, or another Beacon customer, that matched the specified Beacon User. A Beacon User can
        # have multiple active Beacon Report Syndications at once. The results from this endpoint are paginated; the
        # `next_cursor` field will be populated if there is another page of results that can be retrieved. To fetch the
        # next page, pass the `next_cursor` value as the `cursor` parameter in the next request.
        #
        # Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::BeaconReportSyndication` in
        # the `beacon_report_syndications` field of every page, requesting pages as they are needed. Call `pages` on it
        # to get each page as a `Plaid::Types::BeaconReportSyndicationListResponse`, including its other fields.
        #
        # No request is sent by this call. The first page is requested when you start iterating (or call
        # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
        #
        # @param request_options [Hash]
        # @param params [Plaid::BeaconReport::Syndication::Types::BeaconReportSyndicationListRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.beacon_report.syndication.list(beacon_user_id: "becusr_42cF1MNo42r9Xj")
        #
        # @return [Plaid::Internal::CursorItemIterator]
        def list(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          Plaid::Internal::CursorItemIterator.new(
            cursor_field: :next_cursor,
            item_field: :beacon_report_syndications,
            initial_cursor: params[:cursor]
          ) do |next_cursor|
            params[:cursor] = next_cursor
            request = Plaid::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "POST",
              path: "beacon/report_syndication/list",
              body: Plaid::BeaconReport::Syndication::Types::BeaconReportSyndicationListRequest.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Plaid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              begin
                parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::BeaconReportSyndicationListResponse.load(response.body))
              rescue ::JSON::ParserError
                raise Plaid::Errors::ResponseError.new(response.body, code: code, headers: response.to_hash)
              end
              [parsed_response, response]
            else
              error_class = Plaid::Errors::ResponseError.subclass_for_code(code)
              error_types = {
                400 => Plaid::Types::PlaidError,
                401 => Plaid::Types::PlaidError,
                429 => Plaid::Types::PlaidError,
                500 => Plaid::Types::PlaidError,
                (400..499) => Plaid::Types::PlaidError,
                (500..599) => Plaid::Types::PlaidError
              }
              error_body = Plaid::Errors::ResponseError.load_error_body(code, response.body, error_types)
              raise error_class.new(response.body, code: code, body: error_body, headers: response.to_hash)
            end
          end
        end

        # Returns a Beacon Report Syndication for a given Beacon Report Syndication id.
        #
        # @param request_options [Hash]
        # @param params [Plaid::BeaconReport::Syndication::Types::BeaconReportSyndicationGetRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.beacon_report.syndication.get(beacon_report_syndication_id: "becrsn_11111111111111")
        #
        # @return [Plaid::Types::BeaconReportSyndicationGetResponse]
        def get(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "beacon/report_syndication/get",
            body: Plaid::BeaconReport::Syndication::Types::BeaconReportSyndicationGetRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Plaid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            begin
              (response.body.to_s.empty? ? nil : Plaid::Types::BeaconReportSyndicationGetResponse.load(response.body))
            rescue ::JSON::ParserError
              raise Plaid::Errors::ResponseError.new(response.body, code: code, headers: response.to_hash)
            end
          else
            error_class = Plaid::Errors::ResponseError.subclass_for_code(code)
            error_types = {
              400 => Plaid::Types::PlaidError,
              401 => Plaid::Types::PlaidError,
              429 => Plaid::Types::PlaidError,
              500 => Plaid::Types::PlaidError,
              (400..499) => Plaid::Types::PlaidError,
              (500..599) => Plaid::Types::PlaidError
            }
            error_body = Plaid::Errors::ResponseError.load_error_body(code, response.body, error_types)
            raise error_class.new(response.body, code: code, body: error_body, headers: response.to_hash)
          end
        end
      end
    end
  end
end
