class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_review
  before_action :find_idea
  before_action :authorize_user!, only: [:destroy]

  def create
    @review = Review.new review_params
    @review.idea = @idea
    @review.user = current_user

    if @review.save
      flash[:success] = "Review added!"
      redirect_to @idea
    else
      @reviews = @idea.reviews.order(created_at: :desc)
      render "ideas/show"
    end
  end

  def destroy
    @review.destroy
    flash[:success] = "Review deleted"
    redirect_to @idea
  end

  private
  def find_review
    @review = Review.find params[:id] if params[:id].present?
  end

  def find_idea
    @idea = Idea.find params[:idea_id] if params[:idea_id].present?
  end

  def review_params
    params.permit(:body)
    # params.require(:review).permit(:body)
  end

  def authorize_user!
    unless can?(:manage, @review)
      flash[:alert] = "Get outta here, sucka!"
      redirect_to idea_path(@review.idea)
    end
  end

end
