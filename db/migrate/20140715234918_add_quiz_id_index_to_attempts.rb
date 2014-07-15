class AddQuizIdIndexToAttempts < ActiveRecord::Migration
  def change
    add_index :attempts, :quiz_id
  end
end
