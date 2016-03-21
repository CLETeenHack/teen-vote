require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Issues' do
  include_context 'api_data'

  before do
    header 'Accept', 'application/json'
  end

  get '/api/issues' do
    example 'Listing Issues' do
      do_request

      expect(status).to eq 200
      data = JSON.parse(response_body, symbolize_names: true)

      issue = data[:issues].first
      expect(issue[:choices].first).to include(title: 'Yes')
      expect(issue[:votes_url]).to include('/votes')
      expect(issue[:issue_links].first).to include(
        title: 'Test Link',
        href: 'http://www.example.com',
      )
    end
  end
end
