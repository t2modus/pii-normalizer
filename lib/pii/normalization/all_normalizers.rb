# frozen_string_literal: true

require_relative 'address_normalizer'
require_relative 'email_normalizer'
require_relative 'name_normalizer'
require_relative 'phone_normalizer'
require_relative 'vehicle_normalizer'

module PII
  module Normalization
    # this module exists solely to group together all the other normalizers
    # into one great big one
    module AllNormalizers
      include AddressNormalizer
      include EmailNormalizer
      include NameNormalizer
      include PhoneNormalizer
      include VehicleNormalizer
    end
  end
end
