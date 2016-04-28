class VotesController < ApplicationController
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
