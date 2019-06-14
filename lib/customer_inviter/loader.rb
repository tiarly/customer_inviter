# frozen_string_literal: true

require 'active_support/core_ext/hash/keys'
require 'json'

module CustomerInviter
  class Loader
    class << self
      def call(input, file_store: File)
        file_store.readlines(input).map do |line|
          User.new(JSON.parse(line).symbolize_keys)
        end
      end
    end
  end
end
