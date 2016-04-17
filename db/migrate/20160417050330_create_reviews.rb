class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.date :date_given
      t.integer :my_money
      t.integer :my_team
      t.boolean :at_risk
      t.boolean :promote
    end
  end
end
