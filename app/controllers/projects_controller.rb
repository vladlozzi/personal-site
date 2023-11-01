class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.order(:years)
  end

  # GET /projects/1 or /projects/1.json
  def show
    unless session[:editor]
      redirect_to projects_path
    end
  end

  # GET /projects/new
  def new
    if session[:editor]
      @project = Project.new
    else
      redirect_to projects_path
    end
  end

  # GET /projects/1/edit
  def edit
    unless session[:editor]
      redirect_to projects_path
    end
  end

  # POST /projects or /projects.json
  def create
    if session[:editor]
      @project = Project.new(project_params)

      respond_to do |format|
        if @project.save
          format.html { redirect_to project_path(@project), notice: "Новий проєкт успішно дпдано" }
          format.json { render :show, status: :created, location: @project }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    if session[:editor]
      respond_to do |format|
        if @project.update(project_params)
          format.html { redirect_to project_path(@project), notice: "Дані про проєкт успішно змінено" }
          format.json { render :show, status: :ok, location: @project }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    if session[:editor]
      @project.destroy

      respond_to do |format|
        format.html { redirect_to projects_path, notice: "Проєкт успішно видалено" }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      if session[:editor]
        @project = Project.find(params[:id])
      end
    end
    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:years, :href, :name)
    end
end
