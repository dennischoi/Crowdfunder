class PledgesController < ApplicationController
  def create
    if current_user
      @pledge = current_user.pledges.build(pledge_params)
      @project = @pledge.reward.project # 'projects/project_total_money' partial requires access to @project

      respond_to do |format|
        if @pledge.save
          format.html do
            if request.xhr?
              render partial: "projects/project_total_money"
            else
              redirect_to user_path(current_user)
            end
          end
        else
          render "error"
        end
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
