class AddManagerToTeams < ActiveRecord::Migration
  def change
    add_reference :teams, :manager, index: true, foreign_key: true
  end
end
