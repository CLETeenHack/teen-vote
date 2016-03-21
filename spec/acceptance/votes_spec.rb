require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Votes' do
  include_context 'api_data'

  before do
    header 'Accept', 'application/json'
  end

  get '/api/votes' do
    parameter :issue_id
    let(:issue_id) { issue.id }

    example 'Listing Votes by Issue Id' do
      do_request

      expect(status).to eq 200
      data = JSON.parse(response_body, symbolize_names: true)

      vote = data[:votes].first
      expect(vote).to include(
        voter_id: voter.id,
      )
    end
  end

  post '/api/votes' do
    parameter :choice_id, required: true, scope: :vote
    parameter :registration_number, required: true, scope: :vote
    parameter :understand_this, required: false, scope: :vote
    parameter :care_about_this, required: false, scope: :vote

    let(:choice_id) { choice_yes.id }
    let(:registration_number) { voter.registration_number }

    example 'Creating a Vote' do
      do_request

      expect(status).to eq 201
      data = JSON.parse(response_body, symbolize_names: true)
      vote = Vote.last
      expect(data[:vote][:id]).to eq vote.id
    end
  end
end
