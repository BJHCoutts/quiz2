class IdeasController < ApplicationController

  before_action :find_idea

  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @ideas = Idea.order(created_at: :desc)
  end

  def show

  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user

    if @idea.save
      flash[:success] = "Idea posted!"
      redirect_to @idea
    else
      flash.now[:alert] = @idea.errors.full_messages.join(", ")
      render :new
    end
  end

  # def create
  #   Idea.create(idea_params)
  #   @idea.user = current_user
  #   redirect_to ideas_path
  # end

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

  def authorize_user!
    unless can?(:manage, @idea)
      flash[:alert] = "Beat it!"
      redirect_to idea_path(@idea)
    end
  end


end
