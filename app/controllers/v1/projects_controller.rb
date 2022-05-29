class V1::ProjectsController < ApplicationController
  include ActiveStorage::SetCurrent

  def index
    projects = Project.all
    render json: { data: projects }, status: :ok
  end

  def create
    update_params
    project = Project.new(project_params)
    if project.save
      render json: ProjectSerializer.new(project).serialized_json, status: :created
    else
      render json: project.errors, status: :unprocessable_entity
    end
  end

  def show
    project = Project.find(params[:id])
    if project.present?
      render json: ProjectSerializer.new(project).serialized_json, status: :ok
    else
      render json: { error: "Project not found" }, status: :not_found
    end
  end

  def update 
    project = Project.find(params[:id])
    if project.present?
      update_params
      project.update(project_params)
      render json: ProjectSerializer.new(project).serialized_json, status: :ok
    else
      render json: { error: "Project not found" }, status: :not_found
    end
  end

  def my_projects
    if logged_in?
      projects = Project.where(user_id: logged_in_user.id)
      render json: { data: projects }, status: :ok
    else
      render json: { error: "User not logged in" }, status: :unauthorized
    end
  end

  def destroy
    project = Project.find(params[:id])
    if project.present?
      project.destroy
      render json: { message: "Project deleted" }, status: :ok
    else
      render json: { error: "Project not found" }, status: :not_found
    end 
  end

  private

  def update_params
    params.tap do |param|
      param['project_type'] = Project.project_types[param['type']]
      param['user_id'] = logged_in_user.id
      param.delete('type')
    end
  end

  def project_params
    params.permit(:title, :description, :project_type, :location, :thumbnail, :user_id)
  end

end
