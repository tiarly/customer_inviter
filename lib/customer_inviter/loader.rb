# frozen_string_literal: true

require 'active_support/core_ext/hash/keys'
require 'json'

module CustomerInviter
  NotImplementedFileStore = Class.new(StandardError)

  class Loader
    class << self
      # This method smells of :reek:UncommunicativeVariableName
      def call(input, file_store: File)
        file_store.readlines(input).map do |line|
          User.new(JSON.parse(line).symbolize_keys)
        end
      rescue NoMethodError => e
        raise NotImplementedFileStore, e
      end
    end
  end
end
