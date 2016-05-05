class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    if current_user
      @project = current_user.owned_projects.build(project_params)
      binding.pry
      if @project.save
        redirect_to @project
      else
        render :new
      end
    else
      render :new, alert: "You need to login"
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
    if @project.update_attributes(project_params)
      redirect_to @project
    else
      render :edit
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :end_date, :funding_goal, :media_url,
      rewards_attributes: [:name, :description, :amount, :project_id]
    )
  end
end
