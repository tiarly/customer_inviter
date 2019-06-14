# frozen_string_literal: true

require 'ostruct'

module CustomerInviter
  class User < OpenStruct
    include Comparable
    def <=>(other)
      user_id <=> other.user_id
    end

    def latitude
      super.to_f
    end

    def longitude
      super.to_f
    end

    def to_s
      { user_id: user_id, name: name }
    end
  end
end
