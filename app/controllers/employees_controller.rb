class EmployeesController < ApplicationController

  def show
    @employee = Employee.find(params[:id])
    if @employee.reviews
      @reviews = Review.where(employee_id: @employee.id)
    end
    if Review.find_by(reviewer: @employee.id)
      @review = Review.find_by(reviewer: @employee.id)
    end
  end

end
