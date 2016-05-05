class PledgesController < ApplicationController
  def create
    if current_user
      @pledge = current_user.pledges.build(pledge_params)
      if @pledge.save
        redirect_to user_path(current_user)
      else
        render "error"
      end
    else
      render :new, alert: "you need to login"
    end
  end

  private
  def pledge_params
    params.permit(:reward_id)
  end
end
