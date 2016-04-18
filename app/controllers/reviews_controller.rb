class ReviewsController < ApplicationController

  def show
    @review = Review.find_by(id: params[:id], reviewer: session[:employee_id])
  end

  def update
    date = Time.now.strftime("%m/%d/%Y")
    params[:review][:date_given] = date
    @review = Review.update(params[:id], review_params)
    redirect_to employee_path(session[:employee_id])
  end

  private

  def review_params
    params.require(:review).permit(:my_money, :my_team, :at_risk, :promote, :date_given)
  end

end
