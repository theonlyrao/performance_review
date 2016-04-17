class Manager::ReviewsController < Manager::BaseController

  def new
    @employees = Manager.find(session[:manager_id]).employees
  end

  def create
    @review = Review.new
    if @review.save
      reviewer = Employee.find(params[:reviews][:reviewer])
      reviewee = Employee.find(params[:reviews][:reviewee])
      flash[:notice] = "#{reviewer.username} has been assigned to review #{reviewee.username}."
      redirect_to managers_path(reviewer.manager)
    else
    end
  end

end
