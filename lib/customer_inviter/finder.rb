# frozen_string_literal: true

require 'awesome_distance_calculator'

module CustomerInviter
  class Finder
    extend AwesomeDistanceCalculator

    OUR_LOCATION = [53.339428, -6.257664].freeze

    class << self
      def by_distance(users:, range: 100)
        users.select do |user|
          locations = [OUR_LOCATION, [user.latitude, user.longitude]]

          user.distance = calculate(coordinates: locations)

          user.distance <= range
        end
      end
    end
  end
end
