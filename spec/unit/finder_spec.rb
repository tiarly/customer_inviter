# frozen_string_literal: true

require 'spec_helper'

module CustomerInviter
  RSpec.describe Finder do
    let(:instance) { described_class }
    let(:user1) { User.new(latitude: '53.2451022', longitude: '-6.238335') }
    let(:user2) { User.new(latitude: '51.92893', longitude: '-10.27699') }
    let(:users) { [user1, user2] }
    let(:range) { 100 }

    context '#by_distance' do
      subject { instance.by_distance(users: users, range: range) }

      it 'returns users within the given range' do
        is_expected.to eql [user1]
      end
    end

    context '#calculate' do
      it 'responds to calculate' do
        expect(described_class).to respond_to :calculate
      end
    end
  end
end
