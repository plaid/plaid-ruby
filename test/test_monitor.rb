require "date"

require_relative 'test_helper'

# Internal: The test for Plaid::WatchlistScreening.

WATCHLIST_PROGRAM_ID = "prg_egdF5fGjY8fWqk"
LEGAL_NAME = "Domingo Huang"
CLIENT_USER_ID = "monitor-user-" + Time.now.to_i.to_s
DOCUMENT_NUMBER = "123456789"
class PlaidMonitorTest < PlaidTest
  def test_screening_individual
    date_of_birth = Time.now.to_date
    search_terms = Plaid::WatchlistScreeningRequestSearchTerms.new({
        :watchlist_program_id => WATCHLIST_PROGRAM_ID,
        :legal_name => LEGAL_NAME,
        :country => Plaid::CountryCode::US,
        :date_of_birth => date_of_birth,
        :document_number => DOCUMENT_NUMBER,
    })
    monitor_create_request = Plaid::WatchlistScreeningIndividualCreateRequest.new({
        :client_user_id => CLIENT_USER_ID,
        :search_terms => search_terms,
    })
    response = client.watchlist_screening_individual_create(monitor_create_request)
    assert_kind_of(Plaid::WatchlistScreeningIndividualCreateResponse, response)
    assert_equal(LEGAL_NAME, response.search_terms.legal_name)
    assert_equal(DOCUMENT_NUMBER, response.search_terms.document_number)
    assert_equal(date_of_birth, response.search_terms.date_of_birth)
    assert_equal(Plaid::CountryCode::US, response.search_terms.country)

    monitor_update_request = Plaid::WatchlistScreeningIndividualUpdateRequest.new({
        :watchlist_screening_id => response.id,
        :status => Plaid::WatchlistScreeningStatus::PENDING_REVIEW,
    })
    response = client.watchlist_screening_individual_update(monitor_update_request)
    assert_kind_of(Plaid::WatchlistScreeningIndividualUpdateResponse, response)
    assert_equal(Plaid::WatchlistScreeningStatus::PENDING_REVIEW, response.status)

    monitor_list_request = Plaid::WatchlistScreeningIndividualListRequest.new({
        :watchlist_program_id => WATCHLIST_PROGRAM_ID,
        :client_user_id => CLIENT_USER_ID,
    })
    response = client.watchlist_screening_individual_list(monitor_list_request)
    assert_kind_of(Plaid::WatchlistScreeningIndividualListResponse, response)
    assert_equal(1, response.watchlist_screenings.length)

    monitor_get_request = Plaid::WatchlistScreeningIndividualGetRequest.new({
        :watchlist_screening_id => response.watchlist_screenings[0].id,
    })
    response = client.watchlist_screening_individual_get(monitor_get_request)
    assert_kind_of(Plaid::WatchlistScreeningIndividualGetResponse, response)
    assert_equal(LEGAL_NAME, response.search_terms.legal_name)
  end
end