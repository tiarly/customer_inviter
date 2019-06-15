# frozen_string_literal: true

module CustomerInviter
  RSpec.describe CustomerInviter do
    let(:instance) { described_class }
    let(:input) { instance_double('Input') }
    let(:loader) { instance_double('Loader', call: users) }
    let(:finder) { instance_double('Finder', by_distance: []) }
    let(:users) do
      [
        User.new(user_id: 15, name: 'John'),
        User.new(user_id: 2, name: 'Mary')
      ]
    end

    context '#call' do
      subject { instance.call(input, loader: loader, finder: finder) }

      it 'loads the users from the input file' do
        subject

        expect(loader).to have_received(:call).with(input)
      end

      it 'filters users by distance' do
        subject

        expect(finder).to have_received(:by_distance)
          .with(users: users.sort, range: 100)
      end

      context 'when filter does have matches' do
        let(:found_user) { users.first }
        let(:finder) { instance_double('Finder', by_distance: [found_user]) }

        it 'returns the filtered users' do
          is_expected.to eql(
            [{ user_id: found_user.user_id, name: found_user.name }]
          )
        end
      end
    end
  end
end
