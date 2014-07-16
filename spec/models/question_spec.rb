require "spec_helper"

describe Question, "validations" do
  context "when more than one correct answer exists" do
    let(:quiz)     { Quiz.create }
    let(:question) { quiz.questions.create }
    let(:answer)   { question.answers.create(correct: true) }

    it "is not valid if more than one correct answer exists" do
      expect { question.answers.create(correct: true) }.to change { question.valid? }.from(true).to(false)
    end
  end
end