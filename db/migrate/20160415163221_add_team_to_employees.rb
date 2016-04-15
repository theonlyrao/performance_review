class AddTeamToEmployees < ActiveRecord::Migration
  def change
    add_reference :employees, :team, index: true, foreign_key: true
  end
end
