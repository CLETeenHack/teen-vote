class VotesController < ApplicationController
  def index
    @issues = Issue.all
  end
  
  def thanks_for_voting
      
    @issues = Issue.all
  end
  
  def reports
      
    @issues = Issue.all
  end
end
