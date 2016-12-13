class VotesController < ApplicationController

  protect_from_forgery

  def create
    @vote = Vote.find_or_create_by(vote_params)

    if params["tally"] == @vote.tally.to_s
      @vote.tally = 0
      @vote.save
    else
      @vote.tally = params["tally"]
      @vote.save
    end

  end

  private

  def vote_params
    params.permit(:gift_id, :user_id)
  end


end
