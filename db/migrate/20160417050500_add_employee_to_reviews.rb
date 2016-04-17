class AddEmployeeToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :employee, index: true, foreign_key: true
  end
end
