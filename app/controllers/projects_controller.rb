class ProjectsController < ApplicationController
  before_filter :authenticate_user!, :except => :index

  def index
    if !current_user
      redirect_to home_path
    else
      @projects = current_user.projects.all
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(params[:project])
    if !@project.save
      render "new"
    else
      redirect_to projects_path
    end
  end

  def show
    @project = current_user.projects.find(params[:id])
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:id])
    if !@project.update_attributes(params[:project])
      render "new"
    else
      redirect_to projects_path
    end
  end

  def destroy
  end
end
