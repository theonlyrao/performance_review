class Manager::ReviewsController < Manager::BaseController

  def new
    @employees = Manager.find(session[:manager_id]).employees
  end

  def create
    @review = Review.new
    if @review.save
      byebug
      # flash[:notice] =
    else
    end
  end

end
