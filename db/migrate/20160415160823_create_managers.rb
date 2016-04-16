class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :username
      t.string :password_digest
    end
  end
end
