# frozen_string_literal: true

module CustomerInviter
  RSpec.describe CustomerInviter do
    let(:files) do
      Dir[File.join(File.expand_path('..', File.dirname(__FILE__)), '**/*.txt')]
    end

    subject { described_class.call(files.first) }

    context '#call' do
      it 'returns the matched users from the given input file' do
        is_expected.to eql [{ user_id: 12, name: 'Christina McArdle' }]
      end
    end
  end
end
