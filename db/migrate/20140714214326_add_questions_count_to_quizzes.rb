class AddQuestionsCountToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :questions_count, :integer, default: 0
  end
end
