require "spec_helper"

describe Answer, "validations" do
  describe "#only_correct_answer" do
    let(:quiz)     { Quiz.create }
    let(:question) { quiz.questions.create }
    let!(:answer)  { question.answers.create(correct: true) }

    context "when creating another correct answer" do
      it "is not valid" do
        new_question = question.answers.new(correct: true)
        expect { new_question.save }.to_not change { new_question.persisted? }.from(false)
      end
    end

    context "when creating an incorrect answer" do
      it "is valid" do
        new_question = question.answers.new
        expect { new_question.save }.to change { new_question.persisted? }.from(false).to(true)
      end
    end
  end
end