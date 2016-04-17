class Manager::ReviewsController < Manager::BaseController

  def new
    @employees = Manager.find(session[:manager_id]).employees
  end

  def create
    reviewee = Employee.find(params[:reviews][:reviewee])
    @review = Review.new(employee_id: reviewee.id)
    if @review.save
      reviewer = Employee.find(params[:reviews][:reviewer])
      flash[:notice] = "#{reviewer.username} has been assigned to review #{reviewee.username}."
      redirect_to managers_path(reviewer.manager)
    else
    end
  end

end
