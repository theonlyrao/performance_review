class Manager::ReviewsController < Manager::BaseController

  def new
    @employees = Manager.find(session[:manager_id]).employees
  end

  def create
    reviewer = Employee.find(params[:reviews][:reviewer])
    reviewee = Employee.find(params[:reviews][:reviewee])
    @review = Review.new(employee_id: reviewee.id, reviewer: reviewer.id)
    if @review.save
      flash[:notice] = "#{reviewer.username} has been assigned to review #{reviewee.username}."
      redirect_to managers_path(reviewer.manager)
    else
    end
  end

end
