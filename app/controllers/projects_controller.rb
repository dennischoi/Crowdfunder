class ProjectsController < ApplicationController
  def index
    @projects= Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project=current_user.projects.build(project_params)
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def update
  end

  private
  def project_params
    params.require(:projcet).permit(:name, :description, :end_date, :funding_goal, :media_url)
  end
end
