class IdeasController < ApplicationController

  before_action :find_idea

  def new
    @idea = Idea.new
  end

  def create
    render json: params
  end 

  private
  def find_idea
    @idea = Idea.find(params[:id]) if params[:id].present?
  end

  def idea_params
    params.require(:idea).permit(:title, :description)
  end


end
