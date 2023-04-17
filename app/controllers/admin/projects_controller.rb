class Admin::ProjectsController < Admin::AdminController
  before_action :set_project, :only => [ :show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to admin_projects_url
    else
      render :action => :new
    end
    flash[:notice] = "project was successfully created"
  end

  def show
    @page_title = @project.title
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to admin_project_url(@project)
    else
      render :action => :edit
    end
    flash[:notice] = "project was successfully updated"
  end

  def destroy
    @project.destroy
    redirect_to admin_projects_url
    flash[:alert] = "project was successfully deleted"
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :link)
  end
end