class EmployeesController < ApplicationController

  def show
    @employee = Employee.find(params[:id])
    if @employee.reviews
      @reviews = Review.where(employee_id: @employee.id)
    end
  end

end
