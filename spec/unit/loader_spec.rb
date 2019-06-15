# frozen_string_literal: true

require 'spec_helper'

module CustomerInviter
  RSpec.describe Loader do
    let(:instance) { described_class }
    let(:input) { '' }
    let(:user_attributes) { [{ 'user_id' => 1, 'name' => 'John' }.to_json] }
    let(:store) { instance_double('File', readlines: user_attributes) }
    let(:foo_store) { Class }

    context '.call' do
      subject { instance.call(input, file_store: store) }

      context 'when passing a File file_store' do
        it 'calls readlines' do
          subject

          expect(store).to have_received(:readlines).with(input)
        end

        it 'returns a user list' do
          is_expected.to eql [User.new(user_id: 1, name: 'John')]
        end
      end

      context 'when passing an unknown file_store' do
        subject { instance.call(input, file_store: foo_store) }

        it 'raises an error' do
          expect { subject }.to raise_error(NotImplementedFileStore)
        end
      end
    end
  end
end
