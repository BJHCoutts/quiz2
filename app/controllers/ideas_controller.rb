class IdeasController < ApplicationController

  before_action :find_idea

  def index
    @ideas = Idea.order(created_at: :desc)
  end

  def new
    @idea = Idea.new
  end

  def create
    Idea.create(idea_params)
    redirect_to ideas_path
  end

  def edit
  end

  def update
    @idea.update(idea_params)
    redirect_to ideas_path(@idea)
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end

  private
  def find_idea
    @idea = Idea.find(params[:id]) if params[:id].present?
  end

  def idea_params
    params.require(:idea).permit(:title, :description)
  end


end
