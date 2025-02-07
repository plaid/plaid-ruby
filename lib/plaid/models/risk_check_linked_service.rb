=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.617.1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  class RiskCheckLinkedService
    ABOUTME = "aboutme".freeze
    ADOBE = "adobe".freeze
    ADULT_SITES = "adult_sites".freeze
    AIRBNB = "airbnb".freeze
    ALTBALAJI = "altbalaji".freeze
    AMAZON = "amazon".freeze
    APPLE = "apple".freeze
    ARCHIVEORG = "archiveorg".freeze
    ATLASSIAN = "atlassian".freeze
    BITMOJI = "bitmoji".freeze
    BODYBUILDING = "bodybuilding".freeze
    BOOKING = "booking".freeze
    BUKALAPAK = "bukalapak".freeze
    CODECADEMY = "codecademy".freeze
    DELIVEROO = "deliveroo".freeze
    DIIGO = "diigo".freeze
    DISCORD = "discord".freeze
    DISNEYPLUS = "disneyplus".freeze
    DUOLINGO = "duolingo".freeze
    EBAY = "ebay".freeze
    ENVATO = "envato".freeze
    EVENTBRITE = "eventbrite".freeze
    EVERNOTE = "evernote".freeze
    FACEBOOK = "facebook".freeze
    FIREFOX = "firefox".freeze
    FLICKR = "flickr".freeze
    FLIPKART = "flipkart".freeze
    FOURSQUARE = "foursquare".freeze
    FREELANCER = "freelancer".freeze
    GAANA = "gaana".freeze
    GIPHY = "giphy".freeze
    GITHUB = "github".freeze
    GOOGLE = "google".freeze
    GRAVATAR = "gravatar".freeze
    HUBSPOT = "hubspot".freeze
    IMGUR = "imgur".freeze
    INSTAGRAM = "instagram".freeze
    JDID = "jdid".freeze
    KAKAO = "kakao".freeze
    KOMMO = "kommo".freeze
    KOMOOT = "komoot".freeze
    LASTFM = "lastfm".freeze
    LAZADA = "lazada".freeze
    LINE = "line".freeze
    LINKEDIN = "linkedin".freeze
    MAILRU = "mailru".freeze
    MICROSOFT = "microsoft".freeze
    MYSPACE = "myspace".freeze
    NETFLIX = "netflix".freeze
    NIKE = "nike".freeze
    OK = "ok".freeze
    PATREON = "patreon".freeze
    PINTEREST = "pinterest".freeze
    PLURK = "plurk".freeze
    QUORA = "quora".freeze
    QZONE = "qzone".freeze
    RAMBLER = "rambler".freeze
    RAPPI = "rappi".freeze
    REPLIT = "replit".freeze
    SAMSUNG = "samsung".freeze
    SEOCLERKS = "seoclerks".freeze
    SHOPCLUES = "shopclues".freeze
    SKYPE = "skype".freeze
    SNAPCHAT = "snapchat".freeze
    SNAPDEAL = "snapdeal".freeze
    SOUNDCLOUD = "soundcloud".freeze
    SPOTIFY = "spotify".freeze
    STARZ = "starz".freeze
    STRAVA = "strava".freeze
    TARINGA = "taringa".freeze
    TELEGRAM = "telegram".freeze
    TIKI = "tiki".freeze
    TOKOPEDIA = "tokopedia".freeze
    TREEHOUSE = "treehouse".freeze
    TUMBLR = "tumblr".freeze
    TWITTER = "twitter".freeze
    VENMO = "venmo".freeze
    VIBER = "viber".freeze
    VIMEO = "vimeo".freeze
    VIVINO = "vivino".freeze
    VKONTAKTE = "vkontakte".freeze
    WATTPAD = "wattpad".freeze
    WEIBO = "weibo".freeze
    WHATSAPP = "whatsapp".freeze
    WORDPRESS = "wordpress".freeze
    XING = "xing".freeze
    YAHOO = "yahoo".freeze
    YANDEX = "yandex".freeze
    ZALO = "zalo".freeze
    ZOHO = "zoho".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      # We do not validate that the value is one of the enums set in the OpenAPI
      # file because we want to be able to add to our list of enums without
      # breaking this client library.
      value
    end
  end

end
