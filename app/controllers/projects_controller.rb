class ProjectsController < ApplicationController
  skip_before_action :require_login, only: %i(index show)


  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.owned_projects.build(project_params)
    # @project = User.first.owned_projects.build(project_params)
    if current_user
      if @project.save
        redirect_to @project
      else
        render :new
      end
    end
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if current_user
      if @project.update_attributes(project_params)
        redirect_to @project
      else
        render :edit
      end
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :end_date, :funding_goal, :media_url,
      rewards_attributes: [:name, :description, :amount]
    )
  end
end
