require 'rails_helper'

RSpec.describe Project::Show do
  let!(:client) { create(:client) }
  let(:request_double) { double(headers: with_auth_headers(client)) }
  subject(:service) { described_class.call({ request: request_double, params: params}) }

  context 'valid' do
    describe 'when id exists' do
      let(:project) { create(:project) }
      let(:params) { { id: project.id } }

      it { expect(subject.success?).to be_truthy }
      it { expect(subject['model']).to eq(project) }
    end
  end

  context 'when id does not exist' do
    let(:params) { { id: -1 } }

    it { expect{ service }.to raise_error(ActiveRecord::RecordNotFound) }
  end
end
