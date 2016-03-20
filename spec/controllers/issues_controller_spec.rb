require 'rails_helper'

RSpec.describe IssuesController, type: :controller do

  context 'JSON API' do
    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it 'returns all issues'
      it 'includes the issue links'
      it 'includes the choices'
    end
  end

end
