class VotesController < ApplicationController

  def new

    unless session[:voter]
      redirect_to new_registration_path
    else
      @voter = Voter.find_by(session[:voter]['id'])
      @issues = Issue.all
      @national_issues = Issue.joins(:issue_type)
                              .where(issue_types: {national: true})
                              .all
      @state_issues = Issue.joins(:issue_type)
                           .where(issue_types: {state: true})
                           .all
    end
  end
  def create
    voter = Voter.find(params[:voter_id])
    voter.votes.destroy_all
    if issue_params
      issues = Issue.where(id:params[:issue].keys)
      choices = issues.map{|i|i.choices.where(id:params[:issue][i.id.to_s])}.flatten
      choices.each do |choice|
        issue_id = choice.issue_id.to_s
        Vote.create!(
          voter_id: voter.id,
          choice_id: choice.id,
          understand_this: understand_this_params[issue_id],
          care_about_this: care_about_this_params[issue_id]
        )
      end
    end
  end
  def thanks_for_voting
  end

  def results
    @issues = Issue.all
    @national_issues = Issue.joins(:issue_type)
                            .where(issue_types: {national: true})
                            .all
    @state_issues = Issue.joins(:issue_type)
                         .where(issue_types: {state: true})
  end

  private

  def issue_params
    params.require(:issue)
  end

  def understand_this_params
    params.require(:understand_this)
  end

  def care_about_this_params
    params.require(:care_about_this)
  end

  def index
    @issues = Issue.all
  end

  def voter
    Voter.find_by(session[:voter]['id'])
  end
end
