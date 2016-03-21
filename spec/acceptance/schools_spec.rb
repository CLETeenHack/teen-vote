require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Schools' do
  include_context 'api_data'

  before do
    header 'Accept', 'application/json'
  end

  get '/api/schools' do
    example 'Listing Schools' do
      do_request

      expect(status).to eq 200
      data = JSON.parse(response_body, symbolize_names: true)
      expect(data[:schools].first).to include(name: school.name)
    end
  end
end
