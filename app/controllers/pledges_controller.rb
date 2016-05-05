class PledgesController < ApplicationController
  def create
    @pledge = current_user.pledges.build(pledge_params)
    if @pledge.save
      redirect_to user_path(current_user)
    else
      render "error"
    end
  end

  private
  def pledge_params
    params.permit(:reward_id)
  end
end
