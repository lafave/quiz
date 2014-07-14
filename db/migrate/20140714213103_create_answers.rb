class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :url
      t.boolean :correct
      t.integer :question_id

      t.timestamps
    end
  end
end
