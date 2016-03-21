require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Issues' do
  include_context 'api_data'

  before do
    header 'Accept', 'application/json'
  end

  get '/api/issues' do
    example 'Listing issues' do
      do_request

      expect(status).to eq 200
      data = JSON.parse(response_body, symbolize_names: true)

      issue = data[:issues].first
      expect(issue[:choices].first).to include(title: 'Yes')
      expect(issue[:votes_url]).to include('/votes')
    end
  end
end
