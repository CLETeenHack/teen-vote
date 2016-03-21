class Api::IssuesController < ApplicationController
  def index
    render json: Issue.all
  end
end
