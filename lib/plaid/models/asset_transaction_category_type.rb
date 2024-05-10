=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.517.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  class AssetTransactionCategoryType
    ATM_FEE = "ATMFee".freeze
    ADVERTISING = "Advertising".freeze
    AIR_TRAVEL = "AirTravel".freeze
    ALCOHOL_BARS = "AlcoholBars".freeze
    ALLOWANCE = "Allowance".freeze
    AMUSEMENT = "Amusement".freeze
    ARTS = "Arts".freeze
    AUTO_TRANSPORT = "AutoTransport".freeze
    AUTO_INSURANCE = "AutoInsurance".freeze
    AUTO_PAYMENT = "AutoPayment".freeze
    BABY_SUPPLIES = "BabySupplies".freeze
    BABYSITTER_DAYCARE = "BabysitterDaycare".freeze
    BANK_FEE = "BankFee".freeze
    BILLS_UTILITIES = "BillsUtilities".freeze
    BONUS = "Bonus".freeze
    BOOKS_SUPPLIES = "BooksSupplies".freeze
    BUSINESS_SERVICES = "Business Services".freeze
    BUY = "Buy".freeze
    CASH_ATM = "CashATM".freeze
    CHARITY = "Charity".freeze
    CHECK = "Check".freeze
    CHILD_SUPPORT = "ChildSupport".freeze
    CLOTHING = "Clothing".freeze
    COFFEE_SHOPS = "CoffeeShops".freeze
    CREDIT_CARD_PAYMENT = "CreditCardPayment".freeze
    DENTIST = "Dentist".freeze
    DOCTOR = "Doctor".freeze
    EDUCATION = "Education".freeze
    ELECTRONICS_SOFTWARE = "ElectronicsSoftware".freeze
    ENTERTAINMENT = "Entertainment".freeze
    EYECARE = "Eyecare".freeze
    FAST_FOOD = "FastFood".freeze
    FEDERAL_TAX = "FederalTax".freeze
    FEES_CHARGES = "FeesCharges".freeze
    FINANCE_CHARGE = "FinanceCharge".freeze
    FINANCIAL = "Financial".freeze
    FINANCIAL_ADVISOR = "FinancialAdvisor".freeze
    FOOD_DINING = "FoodDining".freeze
    FURNISHINGS = "Furnishings".freeze
    GAS_FUEL = "GasFuel".freeze
    GIFTS_DONATIONS = "GiftsDonations".freeze
    GROCERIES = "Groceries".freeze
    GYM = "Gym".freeze
    HAIR = "Hair".freeze
    HEALTH_FITNESS = "HealthFitness".freeze
    HEALTH_INSURANCE = "HealthInsurance".freeze
    HOBBIES = "Hobbies".freeze
    HOME = "Home".freeze
    HOME_IMPROVEMENT = "HomeImprovement".freeze
    HOME_INSURANCE = "HomeInsurance".freeze
    HOME_PHONE = "HomePhone".freeze
    HOME_SERVICES = "HomeServices".freeze
    HOME_SUPPLIES = "HomeSupplies".freeze
    HOTEL = "Hotel".freeze
    INCOME = "Income".freeze
    INTEREST_INCOME = "InterestIncome".freeze
    INTERNET = "Internet".freeze
    INVESTMENTS = "Investments".freeze
    KIDS = "Kids".freeze
    KIDS_ACTIVITIES = "KidsActivities".freeze
    LATE_FEE = "LateFee".freeze
    LAUNDRY = "Laundry".freeze
    LAWN_GARDEN = "LawnGarden".freeze
    LEGAL = "Legal".freeze
    LIFE_INSURANCE = "LifeInsurance".freeze
    LOAN_INSURANCE = "LoanInsurance".freeze
    LOAN_PAYMENT = "LoanPayment".freeze
    LOANS = "Loans".freeze
    MOBILE_PHONE = "MobilePhone".freeze
    MORTGAGE_RENT = "MortgageRent".freeze
    MOVIES_DVDS = "MoviesDVDs".freeze
    MUSIC = "Music".freeze
    NEWSPAPERS_MAGAZINES = "NewspapersMagazines".freeze
    OFFICE_SUPPLIES = "OfficeSupplies".freeze
    PARKING = "Parking".freeze
    PAYCHECK = "Paycheck".freeze
    PERSONAL_CARE = "PersonalCare".freeze
    PET_FOOD_SUPPLIES = "PetFoodSupplies".freeze
    PET_GROOMING = "PetGrooming".freeze
    PETS = "Pets".freeze
    PHARMACY = "Pharmacy".freeze
    PRINTING = "Printing".freeze
    PROPERTY_TAX = "Property Tax".freeze
    PUBLIC_TRANSPORTATION = "Public Transportation".freeze
    REIMBURSEMENT = "Reimbursement".freeze
    RENTAL_CAR_TAXI = "RentalCarTaxi".freeze
    RESTAURANTS = "Restaurants".freeze
    SALES_TAX = "SalesTax".freeze
    SERVICE_PARTS = "ServiceParts".freeze
    SERVICE_FEE = "ServiceFee".freeze
    SHIPPING = "Shipping".freeze
    SHOPPING = "Shopping".freeze
    SPA_MASSAGE = "SpaMassage".freeze
    SPORTING_GOODS = "SportingGoods".freeze
    SPORTS = "Sports".freeze
    STATE_TAX = "StateTax".freeze
    STUDENT_LOAN = "Student Loan".freeze
    TAXES = "Taxes".freeze
    TELEVISION = "Television".freeze
    TOYS = "Toys".freeze
    TRANSFER = "Transfer".freeze
    TRAVEL = "Travel".freeze
    TUITION = "Tuition".freeze
    UNCATEGORIZED = "Uncategorized".freeze
    UTILITIES = "Utilities".freeze
    VACATION = "Vacation".freeze
    VETERINARY = "Veterinary".freeze

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
