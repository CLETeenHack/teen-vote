class IssuesController < ApplicationController
  def index
    @issues = Issue.all
    @national_issues = Issue.joins(:issue_type)
                            .where(issue_types: {national: true})
                            .all
    @state_issues = Issue.joins(:issue_type)
                         .where(issue_types: {state: true})
                         .all
  end

  def show
    @issue = Issue.find(params[:id])
  end
end
