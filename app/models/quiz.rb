class Quiz < ActiveRecord::Base
  # Relationships
  has_many :attempts,  dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers,   through: :questions
end
