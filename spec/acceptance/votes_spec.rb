require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Votes' do
  include_context 'api_data'

  before do
    header 'Accept', 'application/json'
  end

  parameter :issue_id
  let(:issue_id) { issue.id }

  get '/api/votes' do
    example 'Listing votes' do
      do_request

      expect(status).to eq 200
      data = JSON.parse(response_body, symbolize_names: true)

      vote = data[:votes].first
      expect(vote).to include(
        voter_id: voter.id,
      )
    end
  end
end
