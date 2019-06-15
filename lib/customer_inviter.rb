# frozen_string_literal: true

require 'rubygems'
require 'bundler'

Bundler.setup

require 'customer_inviter/models/user'
require 'customer_inviter/loader'
require 'customer_inviter/finder'

module CustomerInviter
  module ClassMethods
    # This method smells of :reek:UtilityFunction
    def call(input, loader: Loader, finder: Finder)
      users = loader.call(input)

      finder
        .by_distance(users: users.sort, range: 100)
        .map(&:to_s)
    end
  end

  extend ClassMethods
end
