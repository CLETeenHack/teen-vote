class VotesController < ApplicationController

  def new
    #TODO: after registration system is in place, use the active voter instead of just the first one
    @voter = Voter.first
    @issues = Issue.all
  end
  def create
    voter = Voter.find(params[:voter_id])
    issues = Issue.where(id:params[:issue].keys)
    choices = issues.map{|i|i.choices.where(id:params[:issue][i.id.to_s])}.flatten
    binding.pry
    choices.each do |choice|
      Vote.create!(voter_id: voter.id, choice_id: choice.id)
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:name, :description, :bulk_quantity, :price, :last_ordered, :stock_item)
  end
end
