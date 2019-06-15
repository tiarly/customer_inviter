# frozen_string_literal: true

require 'spec_helper'

module CustomerInviter
  RSpec.describe User do
    let(:instance) do
      described_class.new(
        name: 'John Doe',
        user_id: 13,
        latitude: '52.321',
        longitude: '-6.123'
      )
    end

    context 'attibutes' do
      it 'returns the latitude as float' do
        expect(instance.latitude).to eql(52.321)
      end

      it 'returns the longitude as float' do
        expect(instance.longitude).to eql(-6.123)
      end
    end

    context '.to_s' do
      it 'returns the formatted user_id and name' do
        expect(instance.to_s).to eql(
          user_id: instance.user_id, name: instance.name
        )
      end
    end

    context '.<=>' do
      context 'when comparing with a user_id that is less than self' do
        it 'compares based on user_id field' do
          other_user = described_class.new(name: 'Mary', user_id: 12)

          expect(instance.<=>(other_user)).to eql 1
        end
      end

      context 'when comparing with a user_id that is greater than self' do
        it 'compares based on user_id field' do
          other_user = described_class.new(name: 'Mary', user_id: 14)

          expect(instance.<=>(other_user)).to eql(-1)
        end
      end

      context 'when comparing with a user_id that is equal than self' do
        it 'compares based on user_id field' do
          other_user = described_class.new(name: 'Mary', user_id: 13)

          expect(instance.<=>(other_user)).to eql 0
        end
      end
    end
  end
end
