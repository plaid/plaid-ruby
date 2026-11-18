# frozen_string_literal: true

module Plaid
  module WatchlistScreeningEntity
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Create a new entity watchlist screening to check your customer against watchlists defined in the associated
      # entity watchlist program. If your associated program has ongoing screening enabled, this is the profile
      # information that will be used to monitor your customer over time.
      #
      # @param request_options [Hash]
      # @param params [Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.watchlist_screening_entity.create(search_terms: {
      #     entity_watchlist_program_id: "entprg_2eRPsDnL66rZ7H",
      #     legal_name: "Al-Qaida"
      #   })
      #
      # @return [Plaid::Types::WatchlistScreeningEntityCreateResponse]
      def create(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "watchlist_screening/entity/create",
          body: Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::WatchlistScreeningEntityCreateResponse.load(response.body))
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

      # Retrieve an entity watchlist screening.
      #
      # @param request_options [Hash]
      # @param params [Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.watchlist_screening_entity.get(entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np")
      #
      # @return [Plaid::Types::WatchlistScreeningEntityGetResponse]
      def get(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "watchlist_screening/entity/get",
          body: Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::WatchlistScreeningEntityGetResponse.load(response.body))
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

      # List all changes to the entity watchlist screening in reverse-chronological order. If the watchlist screening
      # has not been edited, no history will be returned.
      #
      # Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::EntityWatchlistScreening` in the
      # `entity_watchlist_screenings` field of every page, requesting pages as they are needed. Call `pages` on it to
      # get each page as a `Plaid::Types::WatchlistScreeningEntityHistoryListResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityHistoryListRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.watchlist_screening_entity.list_history(entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np")
      #
      # @return [Plaid::Internal::CursorItemIterator]
      def list_history(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        Plaid::Internal::CursorItemIterator.new(
          cursor_field: :next_cursor,
          item_field: :entity_watchlist_screenings,
          initial_cursor: params[:cursor]
        ) do |next_cursor|
          params[:cursor] = next_cursor
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "watchlist_screening/entity/history/list",
            body: Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityHistoryListRequest.new(params).to_h,
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
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::WatchlistScreeningEntityHistoryListResponse.load(response.body))
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

      # List all hits for the entity watchlist screening.
      #
      # Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::EntityWatchlistScreeningHit` in
      # the `entity_watchlist_screening_hits` field of every page, requesting pages as they are needed. Call `pages` on
      # it to get each page as a `Plaid::Types::WatchlistScreeningEntityHitListResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityHitListRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.watchlist_screening_entity.list_hits(entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np")
      #
      # @return [Plaid::Internal::CursorItemIterator]
      def list_hits(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        Plaid::Internal::CursorItemIterator.new(
          cursor_field: :next_cursor,
          item_field: :entity_watchlist_screening_hits,
          initial_cursor: params[:cursor]
        ) do |next_cursor|
          params[:cursor] = next_cursor
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "watchlist_screening/entity/hit/list",
            body: Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityHitListRequest.new(params).to_h,
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
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::WatchlistScreeningEntityHitListResponse.load(response.body))
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

      # List all entity screenings.
      #
      # Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::EntityWatchlistScreening` in the
      # `entity_watchlist_screenings` field of every page, requesting pages as they are needed. Call `pages` on it to
      # get each page as a `Plaid::Types::WatchlistScreeningEntityListResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityListRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.watchlist_screening_entity.list(entity_watchlist_program_id: "entprg_2eRPsDnL66rZ7H")
      #
      # @return [Plaid::Internal::CursorItemIterator]
      def list(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        Plaid::Internal::CursorItemIterator.new(
          cursor_field: :next_cursor,
          item_field: :entity_watchlist_screenings,
          initial_cursor: params[:cursor]
        ) do |next_cursor|
          params[:cursor] = next_cursor
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "watchlist_screening/entity/list",
            body: Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityListRequest.new(params).to_h,
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
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::WatchlistScreeningEntityListResponse.load(response.body))
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

      # Get an entity watchlist screening program
      #
      # @param request_options [Hash]
      # @param params [Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityProgramGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.watchlist_screening_entity.get_program(entity_watchlist_program_id: "entprg_2eRPsDnL66rZ7H")
      #
      # @return [Plaid::Types::WatchlistScreeningEntityProgramGetResponse]
      def get_program(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "watchlist_screening/entity/program/get",
          body: Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityProgramGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::WatchlistScreeningEntityProgramGetResponse.load(response.body))
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

      # List all entity watchlist screening programs
      #
      # Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::EntityWatchlistProgram` in the
      # `entity_watchlist_programs` field of every page, requesting pages as they are needed. Call `pages` on it to get
      # each page as a `Plaid::Types::WatchlistScreeningEntityProgramListResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityProgramListRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.watchlist_screening_entity.list_programs
      #
      # @return [Plaid::Internal::CursorItemIterator]
      def list_programs(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        Plaid::Internal::CursorItemIterator.new(
          cursor_field: :next_cursor,
          item_field: :entity_watchlist_programs,
          initial_cursor: params[:cursor]
        ) do |next_cursor|
          params[:cursor] = next_cursor
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "watchlist_screening/entity/program/list",
            body: Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityProgramListRequest.new(params).to_h,
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
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::WatchlistScreeningEntityProgramListResponse.load(response.body))
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

      # Create a review for an entity watchlist screening. Reviews are compliance reports created by users in your
      # organization regarding the relevance of potential hits found by Plaid.
      #
      # @param request_options [Hash]
      # @param params [Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityReviewCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.watchlist_screening_entity.create_review(
      #     confirmed_hits: ["enthit_52xR9LKo77r1Np"],
      #     dismissed_hits: ["enthit_52xR9LKo77r1Np"],
      #     entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np"
      #   )
      #
      # @return [Plaid::Types::WatchlistScreeningEntityReviewCreateResponse]
      def create_review(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "watchlist_screening/entity/review/create",
          body: Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityReviewCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::WatchlistScreeningEntityReviewCreateResponse.load(response.body))
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

      # List all reviews for a particular entity watchlist screening. Reviews are compliance reports created by users in
      # your organization regarding the relevance of potential hits found by Plaid.
      #
      # Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::EntityWatchlistScreeningReview`
      # in the `entity_watchlist_screening_reviews` field of every page, requesting pages as they are needed. Call
      # `pages` on it to get each page as a `Plaid::Types::WatchlistScreeningEntityReviewListResponse`, including its
      # other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityReviewListRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.watchlist_screening_entity.list_reviews(entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np")
      #
      # @return [Plaid::Internal::CursorItemIterator]
      def list_reviews(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        Plaid::Internal::CursorItemIterator.new(
          cursor_field: :next_cursor,
          item_field: :entity_watchlist_screening_reviews,
          initial_cursor: params[:cursor]
        ) do |next_cursor|
          params[:cursor] = next_cursor
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "watchlist_screening/entity/review/list",
            body: Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityReviewListRequest.new(params).to_h,
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
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::WatchlistScreeningEntityReviewListResponse.load(response.body))
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

      # Update an entity watchlist screening.
      #
      # @param request_options [Hash]
      # @param params [Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityUpdateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.watchlist_screening_entity.update(entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np")
      #
      # @return [Plaid::Types::WatchlistScreeningEntityUpdateResponse]
      def update(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "watchlist_screening/entity/update",
          body: Plaid::WatchlistScreeningEntity::Types::WatchlistScreeningEntityUpdateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::WatchlistScreeningEntityUpdateResponse.load(response.body))
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
