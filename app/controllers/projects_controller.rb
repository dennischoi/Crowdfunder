class ProjectsController < ApplicationController
  skip_before_action :require_login, only: %i(index show)
  before_action :owner_login, only: %i(edit update)


  def index
    @projects = if params[:search]
      Project.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      Project.all
    end

    if request.xhr?
      render @projects
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def create

    if current_user
      @project = current_user.owned_projects.build(project_params)
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

    respond_to do |format|
      format.html
      format.js
    end

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
      rewards_attributes: [:name, :description, :amount, :project_id]
    )
  end

  def owner_login
    @project = Project.find(params[:id])
    unless @project.owner == current_user
      redirect_to @project, alert: 'Get the fuck outta here'
    end
  end
end
