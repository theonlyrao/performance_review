class Manager::EmployeesController < Manager::BaseController

  def new
    manager = Manager.find(session[:manager_id])
    @teams = manager.teams
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employee_path(@employee)
    else
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:username, :password, :team_id)
  end

end
