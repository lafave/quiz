class AddQuizIdToAttempts < ActiveRecord::Migration
  def change
    add_column :attempts, :quiz_id, :integer
  end
end
