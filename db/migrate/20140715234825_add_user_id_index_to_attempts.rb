class AddUserIdIndexToAttempts < ActiveRecord::Migration
  def change
    add_index :attempts, :user_id
  end
end
