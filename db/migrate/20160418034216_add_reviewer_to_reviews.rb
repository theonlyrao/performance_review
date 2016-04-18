class AddReviewerToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :reviewer, :integer
  end
end
