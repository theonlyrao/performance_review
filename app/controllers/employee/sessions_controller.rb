class Employee::SessionsController < Employee::BaseController

  def new
  end

  def create
    @employee = Employee.find_by(username: params[:session][:username])
    if @employee && @employee.authenticate(params[:session][:password])
      session[:employee_id] = @employee.id
      redirect_to employee_path(@employee)
    else
    end
  end

end
