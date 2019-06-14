# frozen_string_literal: true

require "rubygems"
require "bundler"

Bundler.setup

require 'customer_inviter/models/user'
require 'customer_inviter/loader'
require 'customer_inviter/finder'

module CustomerInviter
  module ClassMethods
    def call(input)
      users = Loader.call(input)

      Finder
        .by_distance(users: users.sort, range: 100)
        .map(&:to_s)
    end
  end

  extend ClassMethods
end
