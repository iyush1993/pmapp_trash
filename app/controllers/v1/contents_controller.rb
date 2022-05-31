class V1::ContentsController < ApplicationController

  def index
    project = Project.find(params[:project_id])
    contents = project.contents
    render json: { data: contents.map { |content| ContentSerializer.new(content) } }, status: :ok
  end

  def create
    content = Content.new(content_params)
    content.project_id = params[:project_id]
    if content.save
      render json: ContentSerializer.new(content).serialized_json, status: :created
    else
      render json: { errors: content.errors.full_messages }, status: 422
    end
  end

  def show
    content = Content.find(params[:id])
    render json: ContentSerializer.new(content).serialized_json, status: :ok
  end

  def destroy
    content = Content.find(params[:id])
    content.destroy
    head :no_content
  end

  def update
    content = Content.find(params[:id])
    if content.present?
      content.update(content_params)
      render json: ContentSerializer.new(content).serialized_json, status: :ok
    else
      render json: { error: "Content not found" }, status: :not_found
    end
  end

  private

  def content_params
    params.require(:content).permit(:title, :body, :project_id)
  end

end
