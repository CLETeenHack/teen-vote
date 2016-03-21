require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Voters' do
  include_context 'api_data'

  before do
    header 'Accept', 'application/json'
  end

  post '/api/voters' do
    parameter :school_id, required: true, scope: :voter
    parameter :gender, scope: :voter
    parameter :will_be_eighteen, scope: :voter
    parameter :school_year, scope: :voter

    let(:school_id) { school.id }
    let(:gender) { 'f' }
    let(:will_be_eighteen) { false }
    let(:school_year) { 'Sophmore' }

    example 'Creating a Voter' do
      explanation "This creates an 'unauthenticated' voter. Use this when a student doesn't have a registration number"
      do_request

      expect(status).to eq 201
      data = JSON.parse(response_body, symbolize_names: true)
      voter = Voter.last
      expect(data[:voter][:id]).to eq voter.id
    end
  end
end
