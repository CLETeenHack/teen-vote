require 'rails_helper'

describe 'home page' do
  it 'responds with 200 status' do
    get '/'
    expect(response.status).to eq 200
  end
end
