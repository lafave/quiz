require "spec_helper"

describe Answer, "validations" do
  describe "#only_correct_answer" do
    let(:quiz)     { Quiz.create }
    let(:question) { quiz.questions.create }
    let!(:answer)  { question.answers.create(correct: true) }

    it "is not valid if a correct answer already exists" do
      new_question = question.answers.new(correct: true)
      expect { new_question.save }.to_not change { new_question.persisted? }.from(false)
    end
  end
end