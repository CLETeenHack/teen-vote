require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Voters' do
  include_context 'api_data'

  before do
    header 'Accept', 'application/json'
  end

  post '/api/voters' do
    parameter :school_id, required: true, scope: :voter
    parameter :registration_number, required: false, scope: :voter
    parameter :gender, scope: :voter
    parameter :will_be_eighteen, scope: :voter
    parameter :school_year, scope: :voter

    let(:school_id) { school.id }
    let(:gender) { 'f' }
    let(:will_be_eighteen) { false }
    let(:school_year) { 'Sophmore' }
    let(:registration_number) { SecureRandom.uuid }
    let(:voter) do
      Voter.create! registration_number: registration_number
    end

    example 'Creating a Voter' do
      explanation "If a valid registration number is provided, and 'authenticated Voter is created.  If registration number is not present, an 'unauthenticated' voter will be created."
      do_request

      expect(status).to eq 201
      data = JSON.parse(response_body, symbolize_names: true)
      expect(data[:voter][:id]).to eq voter.id
    end
  end
end
