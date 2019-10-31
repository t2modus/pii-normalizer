# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'

module PII
  module Normalization
    module Constants
      BASE_WORDS = Set.new %w[acura associate audi auto automall automotive
                              autoplex bently benz bmw bugatti buick cadillac
                              car carmax carfax chevrolet chevy chrysler co
                              collision corp corporation dodge enterprise
                              ferrari fiat financial focus ford geo gmc haulm
                              hertz honda hummer hyundai inc infiniti isuzu
                              jaguar jeep kawasaki kia lease leasing legacy
                              lexus lincoln llc llp lp lt ltd mazda mercedes
                              merchant mercury mini mitsubishi motor nation
                              nationwide nissan oldsmobile plymouth polaris
                              pontiac porsche preowned ram rent rental saab
                              saturn scion skidoo state statewide subaru suzuki
                              tesla toyota transportation used vehicle
                              volkswagen volvo yamaha].freeze
      COMPANY_WORDS = BASE_WORDS + BASE_WORDS.map(&:pluralize)
    end
  end
end
