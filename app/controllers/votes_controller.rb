class VotesController < ApplicationController

  def new
    #TODO: after registration system is in place, use the active voter instead of just the first one
    @voter = Voter.first
    @issues = Issue.all
    @national_issues = Issue.joins(:issue_type)
                            .where(issue_types: {national: true})
                            .all
    @state_issues = Issue.joins(:issue_type)
                         .where(issue_types: {state: true})
                         .all
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

  private

  def issue_params
    params.require(:issue)
  end

  def understand_this_params
    params.require(:understand_this)
  end

  def care_about_this_params
    params.require(:care_about_this)
  def index
    @issues = Issue.all
  end
  
  def thanks_for_voting
      
    @issues = Issue.all
  end
  
  def results
      
    @issues = Issue.all
  end
end
